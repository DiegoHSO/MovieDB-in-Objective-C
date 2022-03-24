//
//  MovieDBAPI.m
//  MovieDB in Objective-C
//
//  Created by Diego Henrique on 24/03/22.
//
//
#import "MovieDBAPI.h"

@interface MovieDBAPI ()
@end

@implementation MovieDBAPI

- (void)requestGenres: (void (^)(NSDictionary *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/genre/movie/list?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // convert the NSData response to a dictionary
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                // there was a parse error...maybe log it here, too
                completion(nil, error);
            } else {
                // success!
                completion(dictionary, nil);
            }
            NSLog(@"%@", dictionary[@"results"]);
        } else {
            // error from the session...maybe log it here, too
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

- (void)requestTotalPagesWithURL:(NSString*)url completion:(void (^)(NSNumber*, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // convert the NSData response to a dictionary
            NSNumber *pages = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                // there was a parse error...maybe log it here, too
                completion(nil, error);
            } else {
                // success!
                completion(pages, nil);
            }
//            NSLog(@"%@", dictionary[@"results"]);
        } else {
            // error from the session...maybe log it here, too
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}
- (void)requestMoviePosterWithURL:(NSString*)url completion:(void (^)(UIImage *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://image.tmdb.org/t/p/original", url]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // convert the NSData response to a dictionary
            UIImage *image = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                // there was a parse error...maybe log it here, too
                completion(nil, error);
            } else {
                // success!
                completion(image, nil);
            }
//            NSLog(@"%@", dictionary[@"results"]);
        } else {
            // error from the session...maybe log it here, too
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

- (void)requestPopularMoviesFromPage:(NSNumber*)page completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://api.themoviedb.org/3/movie/popular?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US&page=", page]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // convert the NSData response to a dictionary
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                // there was a parse error...maybe log it here, too
                completion(nil, error);
            } else {
                // success!
                completion(dictionary, nil);
            }
            NSLog(@"%@", dictionary[@"results"]);
        } else {
            // error from the session...maybe log it here, too
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
    
}
- (void)requestNowPlayingMoviesFromPage:(NSNumber*)page completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%s%@", "https://api.themoviedb.org/3/movie/now_playing?api_key=2c84bee7ec597369d0b15bc1d8b7d41e&language=en-US&page=", page]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // convert the NSData response to a dictionary
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                // there was a parse error...maybe log it here, too
                completion(nil, error);
            } else {
                // success!
                completion(dictionary, nil);
            }
            NSLog(@"%@", dictionary[@"results"]);
        } else {
            // error from the session...maybe log it here, too
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

@end


