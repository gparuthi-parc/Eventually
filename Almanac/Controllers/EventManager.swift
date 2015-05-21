//
//  EventManager.swift
//  Almanac
//
//  Created by David Barsky on 5/16/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import EventKit
import Timepiece

class EventManager {
    static let sharedInstance = EventManager()
    private let eventStore = EKEventStore()
    
    init() {
        
    }
    
    func getCalendars() -> Array<AnyObject> {
        let calendars = self.eventStore.calendarsForEntityType(EKEntityTypeEvent)
        
        return calendars
    }
    
    func getEvents(start: NSDate, end: NSDate) -> Array<EKEvent> {
        let now = NSDate()
        let lastWeek = now - 1.week
        let nextWeek = now + 1.week
        
        let eventsPredicate = eventStore.predicateForEventsWithStartDate(now, endDate: nextWeek, calendars: nil)
        let results = self.eventStore.eventsMatchingPredicate(eventsPredicate)
        
        return results as! Array<EKEvent>;
    }
    
    func requestAccess() {
        let store = EKEventStore()
        
        store.requestAccessToEntityType(EKEntityTypeEvent, completion: { (granted, error) -> Void in
            
        })
    }
}
