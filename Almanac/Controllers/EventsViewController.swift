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
    let eventManager = EventManager.sharedInstance
    let reuseIdentifier = "EventCell"
//    var backingArray = [EKEvent]()
    var backingArray = ["1", "2", "3", "4", "5"]

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
//        self.backingArray = EventManager.sharedInstance.getEvents(now - 1.week, end: now - 1.week)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView!.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.contentSize.width, 60)
    }

    // MARK: - Collection view data source

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backingArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> EventCell {
        let cell : EventCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! EventCell
        cell.titleLabel.text = backingArray[indexPath.row]
        
        return cell
    }
}
