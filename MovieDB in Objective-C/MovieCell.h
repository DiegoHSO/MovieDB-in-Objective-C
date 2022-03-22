//
//  MovieCell.h
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 22/03/22.
//

#ifndef MovieCell_h
#define MovieCell_h

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *rateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *poster;

@end

#endif /* MovieCell_h */
