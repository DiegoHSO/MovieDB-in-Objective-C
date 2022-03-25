//
//  MovieDetailsViewController.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailsViewController : UITableViewController
@property (nonatomic, strong) Movie *movie;
@end

