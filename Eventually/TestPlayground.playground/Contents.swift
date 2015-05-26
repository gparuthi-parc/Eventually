//: Playground - noun: a place where people can play

import UIKit
import Timepiece

func rangeOfDates(startDate : NSDate, endDate : NSDate) -> Array<NSDate> {
    var dates = [NSDate]()
    var currentDate = startDate
    
    while currentDate < endDate {
        dates.append(currentDate)
        currentDate = currentDate + 1.day
    }
    
    return dates
}

let startDate = NSDate()
let endDate = startDate + 2.weeks

let dates = rangeOfDates(startDate, endDate)
println(dates)
