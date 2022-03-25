//
//  MovieDBAPI.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//

#import <UIKit/UIKit.h>

@interface MovieDBAPI : NSObject
- (void)requestGenres: (void (^)(NSDictionary *, NSError *))completion;
- (void)requestTotalPagesWithURL:(NSString*)url completion:(void (^)(NSNumber *, NSError *))completion;
- (void)requestMoviePosterWithURL:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion;
- (void)requestPopularMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion;
- (void)requestNowPlayingMoviesFromPage:(NSNumber*)page completion:(void (^)(NSArray *, NSError *))completion;
@end
