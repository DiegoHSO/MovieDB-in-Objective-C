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
#import "Genre.h"

@interface MovieDetailsViewController ()


@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Details";
    self.
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
        
        NSMutableString *genres = [[NSMutableString alloc] init];
        
        for (int i = 0; i < [self.movie.genres count]; i++) {
            if (i == [self.movie.genres count] - 1) {
                Genre *genre = [self.movie.genres objectAtIndex:i];
                [genres appendString:genre.title];
            } else {
                Genre *genre = [self.movie.genres objectAtIndex:i];
                [genres appendString:genre.title];
                [genres appendString:@", "];
            }
        }

        cell.genresLabel.text = genres;
        cell.rateLabel.text = self.movie.rating.doubleValue == 0 ? @"TBD" : [NSString stringWithFormat:@"%.1f", self.movie.rating.doubleValue];
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
