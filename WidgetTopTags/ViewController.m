//
//  ViewController.m
//  WidgetTopTags
//
//  Created by Edward Snowden on 03.02.17.
//  Copyright © 2017 Anna Zelinskaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTopTags];
    tagsArray = [NSMutableArray new];
}

-(IBAction)getTopTags{
    NSURL *url = [FlickrURL URLforTopTags];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url
                                                completionHandler:
                                      ^(NSURL *location, NSURLResponse *response, NSError *error) {
                                          if (!error) {
                                              NSData *jsonResults = [NSData dataWithContentsOfURL:url];
                                              NSDictionary *results = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                                                      options:0
                                                                                                        error:NULL];
                                              NSArray *tags = [results valueForKeyPath:@"hottags.tag"];
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  self.tags = tags;
                                              });
                                          }
                                      }];
    [task resume];
}

- (void)setTags:(NSArray *)tags {
    _tags = tags;
    [self createTag:self.tags];
}

-(void)createTag:(NSArray *)tags {
    for (NSDictionary *tag in tags) {
        [tagsArray addObject: tag [@"_content"]];
    }
    NSUserDefaults *mySharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.digdes.ExtensionSharing"];
    [mySharedDefaults setObject:tagsArray forKey: @"MyKey"];
    [mySharedDefaults synchronize];
}

@end
