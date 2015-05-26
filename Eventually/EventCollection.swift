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
}