//
//  ViewController.h
//  AppRTCDemo
//
//  Created by Deepak on 03/03/16.
//  Copyright © 2016 Deepak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libjingle_peerconnection/RTCEAGLVideoView.h>
#import <AppRTC/ARDAppClient.h>

@interface ViewController :  UIViewController <ARDAppClientDelegate, RTCEAGLVideoViewDelegate>
@property (strong, nonatomic) NSString *roomName;


@end

