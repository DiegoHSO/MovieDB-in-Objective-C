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

@interface MovieViewController ()


@end

@implementation MovieViewController
{
    NSMutableArray *movies;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        NSLog(@"init PlayerDetailsViewController");
        movies = [NSMutableArray arrayWithCapacity:20];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    //    _movies = [NSMutableArray arrayWithCapacity:3];
    self.title = @"Movies";
    
    Movie *movie1 = [[Movie alloc] init];
    movie1.title = @"Spider-Man: No Way Home";
    movie1.rating = [NSNumber numberWithDouble:9.9];
    movie1.movieDescription = @"ABCDE";
    [movies addObject:movie1];
    
    Movie *movie2 = [[Movie alloc] init];
    movie2.title = @"The Batman";
    movie2.rating = [NSNumber numberWithDouble:9.5];
    movie2.movieDescription = @"FGHI";
    [movies addObject:movie2];
    
    Movie *movie3 = [[Movie alloc] init];
    movie3.title = @"Fast and Furious";
    movie3.rating = [NSNumber numberWithDouble:8.3];
    movie3.movieDescription = @"DLNASDJK";
    [movies addObject:movie3];
    
    Movie *movie4 = [[Movie alloc] init];
    movie4.title = @"ASLKDJLASKD";
    movie4.rating = [NSNumber numberWithDouble:2.0];
    movie4.movieDescription = @"";
    [movies addObject:movie4];
    
    Movie *movie5 = [[Movie alloc] init];
    movie5.title = @"AFLNKADFMDSFDSF";
    movie5.rating = [NSNumber numberWithDouble:1.5];
    movie5.movieDescription = @"";
    [movies addObject:movie5];
    
    Movie *movie6 = [[Movie alloc] init];
    movie6.title = @"Julia: The Movie";
    movie6.rating = [NSNumber numberWithDouble:7.5];
    movie6.movieDescription = @"Julia!";
    [movies addObject:movie6];
    
    self.tableView.separatorColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *titleCellIdentifier = @"label";
    static NSString *movieCellIdentifier = @"movie";
    
    if (indexPath.row > 0) {
        MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
        
        Movie *movie = (movies)[indexPath.row];
        
        cell.nameLabel.text = movie.title;
        cell.descriptionLabel.text = movie.movieDescription;
        cell.rateLabel.text = movie.rating.doubleValue == 0 ? @"TBD" : movie.rating.stringValue;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender: indexPath];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"]) {
        
        MovieDetailsViewController *vc = [segue destinationViewController];
        NSInteger index = [(NSIndexPath *)sender row];
        vc.movie = movies[index];
    }
}

@end
