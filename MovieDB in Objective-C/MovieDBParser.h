//
//  MovieDBParser.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Genre.h"

@interface MovieDBParser : NSObject
- (NSDictionary*)parseMovieDictionary:(Movie*)movie;
- (NSDictionary*)parseGenreDictionary:(Genre*)genre;
@end
