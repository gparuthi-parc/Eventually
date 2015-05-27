//
//  NSDate+Eventually.swift
//  Eventually
//
//  Created by David Barsky on 5/26/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import Timepiece

extension NSDate {
    class func getRangeForDates(startDate : NSDate, endDate : NSDate) -> Array<NSDate> {
        var dates = [NSDate]()
        var currentDate = startDate
        
        while currentDate < endDate {
            dates.append(currentDate)
            currentDate = currentDate + 1.day
        }
        
        return dates
    }
}
