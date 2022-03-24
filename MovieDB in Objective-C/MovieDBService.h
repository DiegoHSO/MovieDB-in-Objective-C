//
//  MovieDBService.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//

#import <UIKit/UIKit.h>
#import "MovieDBAPI.h"
#import "MovieDBParser.h"

@interface MovieDBService : NSObject

- (void)getPopularMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion;
- (void)getNowPlayingMovies:(NSNumber*)page completion:(void (^)(NSMutableArray *, NSError *))completion;
- (void)getMoviePoster:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion;
- (void)getGenres:(NSMutableArray*)genreIDs completion:(void (^)(NSMutableArray *, NSError *))completion;
- (void)getTotalPages:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion;

@end
