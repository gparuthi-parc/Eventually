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
    
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var locationLabel = UILabel()
    let fontName = "HelveticaNeue-Light"

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.whiteColor()
        
        // Title Label
        self.addSubview(titleLabel)
        titleLabel.font = UIFont(name: fontName, size: 18)
        layout(titleLabel) { titleLabel in
            let superview = titleLabel.superview!
            
            titleLabel.width == (superview.width - 40)
            titleLabel.centerX == superview.centerX // left aligned
            titleLabel.centerY == superview.centerY - 5
        }
        
        // Date Label
        self.addSubview(dateLabel)
        dateLabel.font = UIFont(name: fontName, size: 14)
        layout(dateLabel) { dateLabel in
            let superview = dateLabel.superview!
            
            dateLabel.width == 50
            dateLabel.centerX == superview.right - 20 // right aligned
            dateLabel.centerY == superview.centerY - 5
        }
    }
}
