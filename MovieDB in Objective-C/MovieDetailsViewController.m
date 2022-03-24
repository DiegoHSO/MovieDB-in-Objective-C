//
//  MovieDetailsViewController.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 23/03/22.
//
//

#import "MovieDetailsViewController.h"
#import "MovieDetailCell.h"
#import "MovieDetailOverviewCell.h"
#import "Movie.h"

@interface MovieDetailsViewController ()


@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *movieDetailCellIdentifier = @"movieDetail";
    static NSString *descriptionCellIdentifier = @"movieDetailOverview";

    if (indexPath.row == 0) {
        MovieDetailCell *cell = (MovieDetailCell *)[tableView dequeueReusableCellWithIdentifier:movieDetailCellIdentifier];

        cell.nameLabel.text = self.movie.title;
        
        NSMutableString *genres;
        for (int i = 0; i < self.movie.genres.count; i++) {
            if (i == self.movie.genres.count-1) {
                [genres appendString:@"\(self.movie.genres[i])"];
            } else {
                [genres appendString:@"\(self.movie.genres[i])"];
            }
        }
        
        cell.genresLabel.text = genres;
        cell.rateLabel.text = self.movie.rating.doubleValue == 0 ? @"TBD" : self.movie.rating.stringValue;
        cell.poster.image = self.movie.poster;
        cell.poster.layer.cornerRadius = 10;

        return cell;


    } else {
        MovieDetailOverviewCell *cell = (MovieDetailOverviewCell *)[tableView dequeueReusableCellWithIdentifier:descriptionCellIdentifier];
        
        cell.overviewLabel.text = self.movie.movieDescription;
        cell.descriptionLabel.text = @"Overview";

        return cell;

    }

}

@end
