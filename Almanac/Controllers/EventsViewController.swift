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

class EventsViewController: UICollectionViewController {
    private let eventStore = EKEventStore()
    private let reuseIdentifier = "EventCell"
    private var backingArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.backingArray = self.getEvents() as [(AnyObject)]
        
        println(self.backingArray)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.reloadData()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
        
        cell.titleLabel.text = "Title"
        cell.detailLabel.text = "This is an event!"
        
        return cell
    }
    
    // MARK: Fetching Events
    
//    func getEvents() -> NSArray {
//        let now = NSDate()
//        let lastWeek = now - 1.week
//        let nextWeek = now + 1.week
//        
//        let eventsPredicate = eventStore.predicateForEventsWithStartDate(lastWeek, endDate: nextWeek, calendars: nil)
//        
//        return self.eventStore.eventsMatchingPredicate(eventsPredicate)
//    }
}

extension EventsViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//    }
}