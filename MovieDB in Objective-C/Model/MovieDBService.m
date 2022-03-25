//
//  MovieDBService.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//

#import "MovieDBService.h"

@interface MovieDBService ()

//@property (nonatomic, assign) MovieDBParser *movieDBParser;
//@property (nonatomic, assign) MovieDBAPI *movieDBAPI;

@end

@implementation MovieDBService {
    MovieDBAPI *movieDBAPI;
    MovieDBParser *movieDBParser;
    
}

- (void)getPopularMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieDBAPI = [[MovieDBAPI alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieDBAPI requestPopularMoviesFromPage:page completion:^(NSArray *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [movies addObject: [self->movieDBParser parseMovieDictionary: dictionary]];
            }
            completion(movies, error);
        }
        
    }];
    
}

- (void)getNowPlayingMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieDBAPI = [[MovieDBAPI alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieDBAPI requestNowPlayingMoviesFromPage:page completion:^(NSArray *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [movies addObject: [self->movieDBParser parseMovieDictionary: dictionary]];
            }
            completion(movies, error);
        }
        
    }];
    
}
- (void)getMoviePoster:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion {
    movieDBAPI = [[MovieDBAPI alloc] init];
    
    [movieDBAPI requestMoviePosterWithURL:url completion:^(UIImage *poster, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            completion(poster, error);
        }
    }];
    
}

- (void)getGenres:(NSArray*)genreIDs completion:(void (^)(NSMutableArray *, NSError *))completion {
    movieDBAPI = [[MovieDBAPI alloc] init];
    movieDBParser = [[MovieDBParser alloc] init];
    
    [movieDBAPI requestGenres:^(NSDictionary *dictionaries, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSMutableArray *genres = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in dictionaries) {
                [genres addObject: [self->movieDBParser parseGenreDictionary: dictionary]];
            }
            completion(genres, error);
        }
    }];
}

- (void)getTotalPages:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion {
    movieDBAPI = [[MovieDBAPI alloc] init];
    
    [movieDBAPI requestTotalPagesWithURL:url completion:^(NSNumber *pages, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            completion(pages, error);
        }
    }];
}

@end
