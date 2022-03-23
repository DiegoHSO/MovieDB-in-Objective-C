//
//  MovieDetailOverviewCell.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//

#import <UIKit/UIKit.h>

@interface MovieDetailOverviewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *overviewLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end
