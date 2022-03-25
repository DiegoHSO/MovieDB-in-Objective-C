//
//  MovieDetailOverviewCell.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//

#import <Foundation/Foundation.h>
#import "MovieDetailOverviewCell.h"

@implementation MovieDetailOverviewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

