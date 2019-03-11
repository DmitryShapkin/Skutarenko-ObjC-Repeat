//
//  ViewController.h
//  SK-Lesson-20 UIView IBOutlets
//
//  Created by Dmitry Shapkin on 11/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView* testView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* arrayViews;

@end

