//
//  AppDelegate.swift
//  Bouncer
//
//  Created by Mads Bielefeldt on 07/06/15.
//  Copyright (c) 2015 GN ReSound. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    struct Motion {
        static let Manager = CMMotionManager()
    }
}

