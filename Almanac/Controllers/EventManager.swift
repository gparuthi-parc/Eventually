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

private let _EventManagerSharedInstance = EventManager()

class EventManager {
    static let sharedInstance = EventManager()
    private let eventStore = EKEventStore()
    
    func getCalendars() -> Array<AnyObject> {
        let calendars = self.eventStore.calendarsForEntityType(EKEntityTypeEvent)
        
        return calendars
    }
    
    func requestAccess() {
        let store = EKEventStore()
        
        store.requestAccessToEntityType(EKEntityTypeEvent, completion: { (granted, error) -> Void in
            println("Granted");
        })
    }
}
