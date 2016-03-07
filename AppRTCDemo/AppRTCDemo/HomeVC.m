//
//  HomeVC.m
//  AppRTCDemo
//
//  Created by Deepak Pandey on 3/7/16.
//  Copyright © 2016 Codiant. All rights reserved.
//

#import "HomeVC.h"
#import "ViewController.h"
@interface HomeVC ()
@property (weak, nonatomic) IBOutlet UITextField *txfRoomName;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action Method
- (IBAction)btnCall_Action:(id)sender {
    
    NSString *roomName = self.txfRoomName.text;
    if (!roomName.length) {
        [self showAlertWithMessage:@"Missing room name."];
        return;
    }
    // Trim whitespaces.
    NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceCharacterSet];
    NSString *trimmedRoom = [roomName stringByTrimmingCharactersInSet:whitespaceSet];
    
    // Check that room name is valid.
    NSError *error = nil;
    NSRegularExpressionOptions options = NSRegularExpressionCaseInsensitive;
    NSRegularExpression *regex =
    [NSRegularExpression regularExpressionWithPattern:@"\\w+"
                                              options:options
                                                error:&error];
    if (error) {
        [self showAlertWithMessage:error.localizedDescription];
        return;
    }
    NSRange matchRange =
    [regex rangeOfFirstMatchInString:trimmedRoom
                             options:0
                               range:NSMakeRange(0, trimmedRoom.length)];
    if (matchRange.location == NSNotFound ||
        matchRange.length != trimmedRoom.length) {
        [self showAlertWithMessage:@"Invalid room name."];
        return;
    }
    
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.roomName = roomName;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Private

- (void)showAlertWithMessage:(NSString*)message {
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
