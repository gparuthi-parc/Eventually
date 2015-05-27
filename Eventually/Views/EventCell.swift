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
        
        self.addLabelToCell(titleLabel, fontName: "HelveticaNeue-Medium", fontSize: 17)
        self.addLabelToCell(locationLabel, fontName: "HelveticaNeue-Light", fontSize: 13)
        self.addLabelToCell(dateLabel, fontName: "HelveticaNeue-Light", fontSize: 13)
        
        layout(titleLabel, locationLabel, dateLabel) { titleLabel, locationLabel, dateLabel in
            let superview = titleLabel.superview!
            
            titleLabel.width == (superview.width - 40)
            titleLabel.centerX == superview.centerX // left aligned
            titleLabel.centerY == superview.centerY - 18
            
            locationLabel.width == (superview.width - 40)
            locationLabel.centerX == superview.centerX
            locationLabel.centerY == titleLabel.centerY + 18
            
            dateLabel.width == (superview.width - 40)
            dateLabel.centerX == superview.centerX
            dateLabel.centerY == locationLabel.centerY + 15
        }
    }
    
    func addLabelToCell(label: UILabel, fontName: String, fontSize: CGFloat) {
        self.addSubview(label)
        label.font = UIFont(name: fontName, size: fontSize)
    }
}
