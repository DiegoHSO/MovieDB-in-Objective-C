//
//  Genre.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 22/03/22.
//

#ifndef Genre_h
#define Genre_h

#import <UIKit/UIKit.h>

@interface Genre : NSObject

@property (nonatomic, assign) NSNumber *genreID;
@property (nonatomic, copy) NSString *title;

@end


#endif /* Genre_h */
