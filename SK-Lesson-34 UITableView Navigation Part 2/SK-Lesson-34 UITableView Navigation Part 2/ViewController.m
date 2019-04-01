//
//  ViewController.m
//  SK-Lesson-34 UITableView Navigation Part 2
//
//  Created by Dmitry Shapkin on 01/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import "ViewController.h"
#import "DSFileCell.h"
#import "UIView+UITableViewCell.h"


@interface ViewController ()

@property (strong, nonatomic) NSArray* contents;
@property (strong, nonatomic) NSString* selectedPath;

@end


@implementation ViewController

- (id)initWithFolderPath:(NSString*)path
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        self.path = path;
    }
    return self;
}

- (void)setPath:(NSString *)path
{
    _path = path;
    
    NSError* error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                        error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];
}

- (void)dealloc
{
    NSLog(@"controller with path %@ has been deallocated", self.path);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.path) {
        self.path = @"/Users";
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.navigationController.viewControllers count] > 1) {
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

- (IBAction)actionInfoCell:(UIButton*)sender
{
    NSLog(@"actionInfoCell");
    
    UITableViewCell* cell = [sender superCell];
    
    if (cell)
    {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];

        [[[UIAlertView alloc]
          initWithTitle:@"Yahoo!"
          message:[NSString stringWithFormat:@"action %ld %ld", indexPath.section, indexPath.row]
          delegate:nil
          cancelButtonTitle:@"OK"
          otherButtonTitles:nil] show];
    }
}

- (NSString*)fileSizeFromValue:(unsigned long long)size {
    
    static NSString* units[] = {@"B", @"KB", @"MB", @"GB", @"TB"};
    static int unitsCount = 5;
    
    int index = 0;
    
    double fileSize = (double)size;
    
    while (fileSize > 1024 && index < unitsCount)
    {
        fileSize /= 1024;
        index++;
    }
    
    return [NSString stringWithFormat:@"%.2f %@", fileSize, units[index]];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *fileIdentifier = @"FileCell";
    static NSString *folderIdentifier = @"FolderCell";
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath])
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:folderIdentifier];
        
        cell.textLabel.text = fileName;
        
        return cell;
    }
    else
    {
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary* attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        DSFileCell *cell = [tableView dequeueReusableCellWithIdentifier:fileIdentifier];
        
        cell.nameLabel.text = fileName;
        cell.sizeLabel.text = [self fileSizeFromValue:[attributes fileSize]];
        
        static NSDateFormatter* dateFormatter = nil;
        
        if (!dateFormatter)
        {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
        }
        
        cell.dateLabel.text = [dateFormatter stringFromDate:[attributes fileModificationDate]];
        
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isDirectoryAtIndexPath:indexPath])
    {
        return 44.f;
    }
    else
    {
        return 80.f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath])
    {
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        //ASDirectoryViewController* vc = [[ASDirectoryViewController alloc] initWithFolderPath:path];
        //[self.navigationController pushViewController:vc animated:YES];
        
//        ViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DSViewController"];
//        vc.path = path;
//        [self.navigationController pushViewController:vc animated:YES];
        
        self.selectedPath = path;

        [self performSegueWithIdentifier:@"navigateDeep" sender:nil];
    }
}


#pragma mark - Segue

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSLog(@"shouldPerformSegueWithIdentifier: %@", identifier);
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    ViewController* vc = segue.destinationViewController;
    vc.path = self.selectedPath;
}

@end
