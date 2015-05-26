//
//  EventCollection.swift
//  Eventually
//
//  Created by David Barsky on 5/25/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import EventKit

struct EventCollection {
    var day = NSDate()
    var events = [EKEvent]()
    
    init(day: NSDate, events: Array<EKEvent>) {
        self.day = day
        self.events = events
    }
}