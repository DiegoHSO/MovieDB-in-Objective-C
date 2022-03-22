//
//  Movie.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 22/03/22.
//

#import <UIKit/UIKit.h>

#ifndef Movie_h
#define Movie_h

@interface Movie : NSObject
    
@property (nonatomic, assign) int *movieID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSString *posterURL;
@property (nonatomic, copy) UIImage *poster;
@property (nonatomic, copy) NSArray *genreIDs;
@property (nonatomic, copy) NSArray *genres;

@end

#endif /* Movie_h */
