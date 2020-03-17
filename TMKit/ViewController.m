//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "LTTranslationMainViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSources;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubviews];
}

- (void)setupSubviews {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    tableView.rowHeight = 44;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

#pragma mark  UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            LTTranslationMainViewController *mainVC = [[LTTranslationMainViewController alloc] init];
            [self.navigationController pushViewController:mainVC animated:YES];
        }
            break;
    }
}

- (NSArray *)dataSources {
    if (!_dataSources) {
        _dataSources = @[@"LTTranslation"];
    }
    return _dataSources;
}

@end