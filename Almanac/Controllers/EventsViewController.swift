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
    var dataStore = Dictionary<NSDate, Array<EKEvent>>()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        self.dataStore = self.getEvents(  now - 1.week
                                        , end: now + 1.week
                                        , eventStore: self.eventStore  )
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
    
    func getEvents(start: NSDate, end: NSDate, eventStore: EKEventStore) -> Dictionary<NSDate, Array<EKEvent>> {
        let eventsPredicate = eventStore.predicateForEventsWithStartDate(start, endDate: end, calendars: nil)
        let allEvents = eventStore.eventsMatchingPredicate(eventsPredicate) as! [EKEvent]
        
        // time to get all unique dates...
        var dates = [NSDate]()
        for event in allEvents {
            dates.append(event.startDate)
        }
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        var dates = [NSDate]()
        for event in self.dataStore {
            dates.append(event.startDate)
        }
        let uniqueDates = Set(dates)
        
        println(Array(uniqueDates).count)
        return Array(uniqueDates).count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataStore.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> EventCell {
        let cell : EventCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
        cell.titleLabel.text = dataStore[indexPath.row].title
        
        return cell
    }
}
