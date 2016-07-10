//
//  ViewController.m
//  PopTest
//
//  Created by king on 16/7/10.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import "CustomCell.h"
#import "FacebookButtonAnimationViewController.h"
#import "WrongPasswordViewController.h"
#import "CustomVCTransitionViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

static NSString * const identifier = @"animationCell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Example";
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[@"Facebook Like & Send", @"Wrong Password", @"Custom VC Transtion"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:identifier];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            FacebookButtonAnimationViewController *fb = [FacebookButtonAnimationViewController new];
            [self.navigationController pushViewController:fb animated:YES];
        }
            break;
        case 1:
        {
            WrongPasswordViewController *wp = [WrongPasswordViewController new];
            [self.navigationController pushViewController:wp animated:YES];
        }
            break;
        case 2:
        {
            CustomVCTransitionViewController *cvc = [CustomVCTransitionViewController new];
            [self.navigationController pushViewController:cvc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
