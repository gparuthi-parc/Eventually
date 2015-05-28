//
//  EventListView.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

@IBDesignable
class EventListView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.headerBackgroundColor()
    }
}
