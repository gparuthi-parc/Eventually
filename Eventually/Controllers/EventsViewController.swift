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

class EventsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let eventStore = EKEventStore()
    let reuseIdentifier = "EventCell"
    let headerReuseIdentifier = "HeaderCell"
    var dataStore = [Int]()

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        self.dataStore = [1, 2, 3, 4, 5]
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSizeMake(self.view.frame.size.width, 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

    // MARK: - CollectionView Data Source
    
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
        return 4
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(self.view.frame.width, 26)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> DateHeaderCell {

        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerReuseIdentifier, forIndexPath: indexPath) as! DateHeaderCell
        header.dateLabel.text = "Wednesday 5/27/15"
        return header
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let sectionCount = collectionView.numberOfSections()
        let rowCount = collectionView.numberOfItemsInSection(indexPath.section)
        if (indexPath.row == rowCount - 1 ) {
            // last cell, do nothing with borders
        } else {
            cell.addBottomBorderWithHeight(1, color: UIColor.borderColor(), leftOffset: 24, rightOffset: 0, bottomOffset: 0)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowEvent" {
            let navigationController: UINavigationController = segue.destinationViewController as! UINavigationController
            let detailViewController: EventDetailViewController = navigationController.viewControllers.first as! EventDetailViewController
            let indexpath = self.collectionView!.indexPathForCell(sender as! EventCell)
            detailViewController.data = self.dataStore[indexpath!.row]
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> EventCell {
        let cell : EventCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
        
        cell.titleLabel.text = "Interview at Tech Company"
        cell.locationLabel.text = "270 Lafayette Street, Suite 1204"
        cell.dateLabel.text = "11:50 – 1:40"
        
        return cell
    }
}
