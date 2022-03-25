//
//  MovieDBParser.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Genre.h"
#import "MovieDBParser.h"

@interface MovieDBParser : NSObject
- (Movie*)parseMovieDictionary:(NSDictionary*)dictionary;
- (Genre*)parseGenreDictionary:(NSDictionary*)dictionary;
@end
