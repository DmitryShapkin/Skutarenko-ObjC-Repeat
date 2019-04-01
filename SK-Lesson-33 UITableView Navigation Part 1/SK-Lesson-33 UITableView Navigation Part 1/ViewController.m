//
//  ViewController.m
//  SK-Lesson-33 UITableView Navigation Part 1
//
//  Created by Dmitry Shapkin on 01/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSArray* contents;

@end


@implementation ViewController

- (id)initWithFolderPath:(NSString*)path
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        self.path = path;
        
        NSError* error = nil;
        
        self.contents =
        [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
        if (error)
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"controller with path %@ has been deallocated", self.path);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = [self.path lastPathComponent];
    
    if ([self.navigationController.viewControllers count] > 1)
    {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"Back to Root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"path = %@", self.path);
    NSLog(@"view controllers on stack = %ld", [self.navigationController.viewControllers count]);
    NSLog(@"index on stack %ld", [self.navigationController.viewControllers indexOfObject:self]);
}

- (BOOL)isDirectoryAtIndexPath:(NSIndexPath*)indexPath
{
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}


#pragma mark - Actions

- (void) actionBackToRoot:(UIBarButtonItem*)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath])
    {
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath])
    {
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        ViewController* vc = [[ViewController alloc] initWithFolderPath:path];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
