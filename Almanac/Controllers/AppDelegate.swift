//
//  AppDelegate.swift
//  Almanac
//
//  Created by David Barsky on 5/15/15
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func applicationDidFinishLaunching(application: UIApplication) {
        EventManager.sharedInstance.requestAccess()
        let events = EventManager.sharedInstance.getEvents()
        
        println(events)
    }
}
