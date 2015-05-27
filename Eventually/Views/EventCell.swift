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
    var calendarIndicator = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(red:1,  green:1,  blue:1, alpha:1)
        
        self.addLabelToCell(titleLabel, fontName: "HelveticaNeue-Regular", fontSize: 16)
        self.addLabelToCell(locationLabel, fontName: "HelveticaNeue-Light", fontSize: 13)
        self.addLabelToCell(dateLabel, fontName: "HelveticaNeue-Light", fontSize: 13)
        self.addCalendarIndicatorToCell(calendarIndicator, color: UIColor(red:0.004,  green:0.553,  blue:1, alpha:1))
        
        layout(titleLabel, locationLabel, dateLabel) { titleLabel, locationLabel, dateLabel in
            let superview = titleLabel.superview!
            
            titleLabel.leadingMargin == superview.leadingMargin + 24
            titleLabel.topMargin == superview.topMargin + 10
            
            locationLabel.leadingMargin == superview.leadingMargin + 24
            locationLabel.topMargin == superview.topMargin + 30
            
            dateLabel.trailingMargin == superview.trailingMargin - 12
            dateLabel.baseline == titleLabel.baseline
        }
        
        layout(calendarIndicator) { calendarIndicator in
            let superview = calendarIndicator.superview!
            
            calendarIndicator.width == 10
            calendarIndicator.height == 10
            calendarIndicator.centerX == superview.leadingMargin + 2
            calendarIndicator.centerY == superview.centerY
        }
    }
    
    // MARK: - Specialized Initializers
    
    func addCalendarIndicatorToCell(indicator: UIView, color: UIColor) {
        self.addSubview(indicator)
        indicator.backgroundColor = color
        indicator.layer.cornerRadius = 5
    }
    
    func addLabelToCell(label: UILabel, fontName: String, fontSize: CGFloat) {
        self.addSubview(label)
        label.font = UIFont(name: fontName, size: fontSize)
    }
}
