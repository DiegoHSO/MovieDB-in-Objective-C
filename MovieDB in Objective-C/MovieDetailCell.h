//
//  MovieDetailCell.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//

#import <UIKit/UIKit.h>

@interface MovieDetailCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *genresLabel;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *poster;

@end
