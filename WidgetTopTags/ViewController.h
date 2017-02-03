//
//  ViewController.h
//  WidgetTopTags
//
//  Created by Edward Snowden on 03.02.17.
//  Copyright © 2017 Anna Zelinskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrURL.h"


@interface ViewController : UIViewController {
@private
    NSMutableArray *tagsArray;
}

@property (nonatomic,strong) NSArray *tags;

@end

