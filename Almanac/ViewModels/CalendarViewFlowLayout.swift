//
//  CalendarViewFlowLayout.swift
//  Almanac
//
//  Created by David Barsky on 5/21/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

class CalendarViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.itemSize = CGSizeMake(320, 60)
    }

    required init(coder aDecoder: NSCoder) {
        super.init()
        println("Intialized")
    }
    
    override func collectionViewContentSize() -> CGSize {
        let contentWidth = self.collectionView?.bounds.size.width as CGFloat!
        return CGSizeMake(contentWidth, 100)
    }
}
