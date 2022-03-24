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
//    movieDBAPI = [[MovieDBAPI alloc] init];

}
- (void)getNowPlayingMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion {
    
}
- (void)getMoviePoster:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion {
    
}
- (void)getGenres:(NSMutableArray*)genreIDs completion:(void (^)(NSMutableArray *, NSError *))completion {
    
}
- (void)getTotalPages:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion {
    
}

@end
