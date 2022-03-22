//
//  MovieViewController.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 21/03/22.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *movies;

@end
