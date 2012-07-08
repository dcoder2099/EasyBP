//
//  BPDetailViewController.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
