//
//  TodayViewController.h
//  widgetTags
//
//  Created by Edward Snowden on 03.02.17.
//  Copyright © 2017 Anna Zelinskaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController{
@private
    IBOutlet UITableView *tableViewTopTags;
    NSMutableArray *tagsArray;
}

@end
