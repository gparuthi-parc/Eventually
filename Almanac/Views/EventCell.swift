//
//  EventCell.swift
//  Almanac
//
//  Created by David Barsky on 5/17/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import Cartography

@IBDesignable
class EventCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.whiteColor()
    }
}
