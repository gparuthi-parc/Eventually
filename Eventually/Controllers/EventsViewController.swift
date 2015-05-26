//
//  EventsViewController.swift
//  Almanac
//
//  Created by David Barsky on 5/16/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import EventKit
import Timepiece
import Dollar

class EventsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let eventStore = EKEventStore()
    let reuseIdentifier = "EventCell"
    var dataStore = Array<EventCollection>()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        self.dataStore = self.getEvents(now - 1.week, end: now + 1.week, eventStore: self.eventStore)
        
        println(self.dataStore)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSizeMake(self.view.frame.size.width, 60)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    // MARK: - Collection view data source
    
    func getEvents(start: NSDate, end: NSDate, eventStore: EKEventStore) -> Array<EventCollection> {
        let eventsPredicate = eventStore.predicateForEventsWithStartDate(start, endDate: end, calendars: nil)
        let allEvents = eventStore.eventsMatchingPredicate(eventsPredicate) as! [EKEvent]
        let allDates = rangeOfDates(start, endDate: end)
        
        var events = Array<EventCollection>()
        for date in allDates {
            let dayPredicate = eventStore.predicateForEventsWithStartDate(date, endDate: date + 1.day, calendars: nil)
            var instance = EventCollection()
            instance.day = date
            instance.events = eventStore.eventsMatchingPredicate(dayPredicate) as! [EKEvent]

            events.append(instance)
        }
        
        return events
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataStore.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> EventCell {
        let cell : EventCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
        
        cell.titleLabel.text = "poop"
        cell.dateLabel.text = "date"
        
        return cell
    }
    
    // MARK: - Helper
    func rangeOfDates(startDate : NSDate, endDate : NSDate) -> Array<NSDate> {
        var dates = [NSDate]()
        var currentDate = startDate
        
        while currentDate < endDate {
            dates.append(currentDate)
            currentDate = currentDate + 1.day
        }
        
        return dates
    }
}
