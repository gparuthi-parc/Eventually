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
        self.dataStore = self.getEvents(now, end: now + 1.day, eventStore: self.eventStore)
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
        let allDates = NSDate.getRangeForDates(start, endDate: end)
        var allEvents = Array<EventCollection>()
        
        for date in allDates {
            let dayPredicate = eventStore.predicateForEventsWithStartDate(date, endDate: date + 1.day, calendars: nil)
            
            if let events = eventStore.eventsMatchingPredicate(dayPredicate) {
                var instance = EventCollection(day: date, events: events as! [EKEvent])
                allEvents.append(instance)
            }
        }
        
        return allEvents
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> EventCell {
        let cell : EventCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
//        let section = dataStore[indexPath.section]
//        println(section.events)
        
        cell.titleLabel.text = "Interview at Triton Research"
        cell.locationLabel.text = "270 Lafayette Street, Suite 1204"
        cell.dateLabel.text = "11:50 – 1:40"
        
        return cell
    }
}
