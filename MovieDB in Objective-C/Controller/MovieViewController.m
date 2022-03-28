//
//  MovieViewController.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 21/03/22.
//

#import "MovieViewController.h"
#import "MovieDetailsViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieDBService.h"

@interface MovieViewController ()


@end

@implementation MovieViewController
{
    NSMutableArray *popularMovies;
    NSMutableArray *nowPlayingMovies;
    NSMutableArray *filteredPopularMovies;
    NSMutableArray *filteredNowPlayingMovies;
    NSNumber *popularMoviesTotalPages;
    NSNumber *nowPlayingMoviesTotalPages;
    NSNumber *popularMoviesPage;
    NSNumber *nowPlayingMoviesPage;
    UISearchController *searchController;
    MovieDBService *service;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        filteredPopularMovies = [[NSMutableArray alloc] init];
        filteredNowPlayingMovies = [[NSMutableArray alloc] init];
        popularMovies = [[NSMutableArray alloc] init];
        nowPlayingMovies = [[NSMutableArray alloc] init];
        popularMoviesPage = [NSNumber numberWithInt:1];
        nowPlayingMoviesPage = [NSNumber numberWithInt:1];
        popularMoviesTotalPages = [[NSNumber alloc] init];
        nowPlayingMoviesTotalPages = [[NSNumber alloc] init];
        
        service = [[MovieDBService alloc] init];
        [service getPopularMovies:popularMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
            if (error) {
                NSLog(@"error fetching movies");
            } else {
                self->popularMovies = movies;
                for (Movie *movie in movies) {
                    [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie image");
                        } else {
                            movie.poster = image;
                        }
                    }];
                    
                    [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie genres");
                        } else {
                            
                            for (Genre *genre in allGenres) {
                                for (NSNumber *genreID in movie.genreIDs) {
                                    if (genreID.intValue == genre.genreID.intValue) {
                                        [movie.genres addObject:genre];
                                    }
                                }
                            }
                        }
                    }];
                }
            }
        }];
        
        [service getNowPlayingMovies:nowPlayingMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
            if (error) {
                NSLog(@"error fetching movies");
            } else {
                self->nowPlayingMovies = movies;
                for (Movie *movie in movies) {
                    [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie image");
                        } else {
                            movie.poster = image;
                        }
                    }];
                    
                    [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                        if (error) {
                            NSLog(@"error fetching movie genres");
                        } else {
                            
                            for (Genre *genre in allGenres) {
                                for (NSNumber *genreID in movie.genreIDs) {
                                    if (genreID.intValue == genre.genreID.intValue) {
                                        [movie.genres addObject:genre];
                                    }
                                }
                            }
                        }
                    }];
                }
            }
        }];
        
        [service getTotalPages:@"https://api.themoviedb.org/3/movie/popular?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US" completion:^(NSNumber *totalPages, NSError *error) {
            if (error) {
                NSLog(@"unable to get popular movies total pages");
            } else {
                self->popularMoviesTotalPages = totalPages;
            }
        }];
        
        [service getTotalPages:@"https://api.themoviedb.org/3/movie/now_playing?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US" completion:^(NSNumber *totalPages, NSError *error) {
            if (error) {
                NSLog(@"unable to get popular movies total pages");
            } else {
                self->nowPlayingMoviesTotalPages = totalPages;
            }
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    searchController = [[UISearchController alloc] init];
    self.navigationItem.searchController = searchController;
    [searchController.searchResultsUpdater self];
    searchController.obscuresBackgroundDuringPresentation = NO;
    
    
    self.title = @"Movies";
    self.tableView.separatorColor = [UIColor clearColor];
}

- (void)updateData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateData:self.navigationItem.searchController.searchBar.text];
        [self.tableView reloadData];
    });
}

- (void)updateData:(NSString*)searchText {
    if ([searchText isEqual: @""]) {
        filteredPopularMovies = popularMovies;
        filteredNowPlayingMovies = nowPlayingMovies;
    }
    
    else {
        [filteredNowPlayingMovies removeAllObjects];
        [filteredPopularMovies removeAllObjects];
        for (Movie* movie in popularMovies) {
            if ([movie.title.lowercaseString containsString:searchText.lowercaseString]) {
                if ([popularMovies containsObject:movie] && ![filteredPopularMovies containsObject:movie]) {
                    [filteredPopularMovies addObject:movie];
                }
            }
        }
        
        for (Movie* movie in nowPlayingMovies) {
            if ([movie.title.lowercaseString containsString:searchText.lowercaseString]) {
                if ([nowPlayingMovies containsObject:movie] && ![filteredNowPlayingMovies containsObject:movie]) {
                    [filteredNowPlayingMovies addObject:movie];
                }
            }
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [filteredPopularMovies count]+1;
    } else {
        return [filteredNowPlayingMovies count]+1;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Uncomment if you want to see Popular Movies pagination (many pages)
    
    /*
    if (indexPath.section == 0) {
        if ([indexPath row] == [filteredPopularMovies count] - 1 && [popularMoviesPage intValue] <= [popularMoviesTotalPages intValue]) {
            [service getPopularMovies:popularMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
                if (error) {
                    NSLog(@"error fetching movies");
                } else {
                    [self->popularMovies addObjectsFromArray:movies];
                    for (Movie *movie in movies) {
                        [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie image");
                            } else {
                                movie.poster = image;
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [self.tableView reloadData];
                                });
                            }
                        }];
                        
                        [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie genres");
                            } else {
                                
                                for (Genre *genre in allGenres) {
                                    for (NSNumber *genreID in movie.genreIDs) {
                                        if (genreID.intValue == genre.genreID.intValue) {
                                            [movie.genres addObject:genre];
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                [self.tableView reloadData];
                                            });
                                        }
                                    }
                                }
                            }
                        }];
                    }
                    self->popularMoviesPage = [NSNumber numberWithInt:[self->popularMoviesPage intValue] + 1];
                    
                }
            }];
        }
    }
     */
    
    
    if (indexPath.section == 1) {
        if ([indexPath row] == [filteredNowPlayingMovies count] - 1 && [nowPlayingMoviesPage intValue] <= [nowPlayingMoviesTotalPages intValue]) {
            [service getNowPlayingMovies:nowPlayingMoviesPage completion:^(NSMutableArray *movies, NSError *error) {
                if (error) {
                    NSLog(@"error fetching movies");
                } else {
                    [self->nowPlayingMovies addObjectsFromArray:movies];
                    for (Movie *movie in movies) {
                        [self->service getMoviePoster:movie.posterURL completion:^(UIImage *image, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie image");
                            } else {
                                movie.poster = image;
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [self updateData];
                                });
                            }
                        }];
                        
                        [self->service getGenres:movie.genreIDs completion:^(NSMutableArray *allGenres, NSError *error) {
                            if (error) {
                                NSLog(@"error fetching movie genres");
                            } else {
                                
                                for (Genre *genre in allGenres) {
                                    for (NSNumber *genreID in movie.genreIDs) {
                                        if (genreID.intValue == genre.genreID.intValue) {
                                            [movie.genres addObject:genre];
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                [self updateData];
                                            });
                                        }
                                    }
                                }
                            }
                        }];
                    }
                    self->nowPlayingMoviesPage = [NSNumber numberWithInt:[self->nowPlayingMoviesPage intValue] + 1];
                }
            }];
        }
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *titleCellIdentifier = @"label";
    static NSString *movieCellIdentifier = @"movie";
    
    if (indexPath.section == 0) {
        if (indexPath.row > 0) {
            MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
            
            Movie *movie = (filteredPopularMovies)[indexPath.row];
            
            cell.nameLabel.text = movie.title;
            cell.descriptionLabel.text = movie.movieDescription;
            cell.rateLabel.text = movie.rating.doubleValue == 0 ? @"TBD" : [NSString stringWithFormat:@"%.1f", movie.rating.doubleValue];
            cell.poster.image = movie.poster;
            cell.poster.layer.cornerRadius = 10;
            
            return cell;
            
            
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:movieCellIdentifier];
            }
            cell.textLabel.text = @"Popular Movies";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
            
        }
    }
    
    else {
        if (indexPath.row > 0) {
            MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
            
            Movie *movie = (filteredNowPlayingMovies)[indexPath.row];
            
            cell.nameLabel.text = movie.title;
            cell.descriptionLabel.text = movie.movieDescription;
            cell.rateLabel.text = movie.rating.doubleValue == 0 ? @"TBD" : [NSString stringWithFormat:@"%.1f", movie.rating.doubleValue];
            cell.poster.image = movie.poster;
            cell.poster.layer.cornerRadius = 10;
            
            return cell;
            
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:movieCellIdentifier];
            }
            cell.textLabel.text = @"Now Playing";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender: indexPath];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"]) {
        
        MovieDetailsViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        if ([indexPath section] == 0) {
            vc.movie = filteredPopularMovies[[indexPath row]];
        } else {
            vc.movie = filteredNowPlayingMovies[[indexPath row]];
        }
        
    }
}

- (void)updateSearchResults:(UISearchController*)searchController {
    [self updateData:searchController.searchBar.text];
    [self.tableView reloadData];
}

@end
