//
//  MovieDetailsViewController.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//

//#import <Foundation/Foundation.h>
//#import "Movie"
//#import "MovieCell.h"
//#import "Movie.h"
//
//@interface MovieViewController ()
//
//
//@end
//
//@implementation MovieViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.movies count] + 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *titleCellIdentifier = @"label";
//    static NSString *movieCellIdentifier = @"movie";
//    
//    if (indexPath.row > 0) {
//        MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
//        
//        Movie *movie = (self.movies)[indexPath.row];
//
//        cell.nameLabel.text = movie.title;
//        cell.descriptionLabel.text = movie.description;
//        cell.rateLabel.text = movie.rating.doubleValue == 0 ? @"TBD" : movie.rating.stringValue;
//        cell.poster.image = movie.poster;
//        cell.poster.layer.cornerRadius = 10;
//        
//        return cell;
//        
//        
//    } else {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCellIdentifier];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                          reuseIdentifier:movieCellIdentifier];
//        }
//        
//        return cell;
//        
//    }
//    
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"detail"]) {
//
//        UINavigationController *navigationController = segue.destinationViewController;
//        MovieDetailsViewController *MovieDetailsViewController = [navigationController viewControllers][0];
//      //  playerDetailsViewController.delegate = self;
//    }
//}
//
//
//@end
