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
        self.backgroundColor = UIColor.whiteColor()
        
        self.addLabelToCell(titleLabel, fontName: "AktivGroteskTrial-Regular", fontSize: 16, textColor: UIColor.primaryTextColor())
        self.addLabelToCell(locationLabel, fontName: "AktivGroteskTrial-Light", fontSize: 13, textColor: UIColor.primaryTextColor())
        self.addLabelToCell(dateLabel, fontName: "AktivGroteskTrial-Light", fontSize: 13, textColor: UIColor.primaryTextColor())
        self.addCalendarIndicatorToCell(calendarIndicator, color: UIColor(red:0.004,  green:0.553,  blue:1, alpha:1))
        
        layout(titleLabel, locationLabel, dateLabel) { titleLabel, locationLabel, dateLabel in
            let superview = titleLabel.superview!
            
            titleLabel.leadingMargin == superview.leadingMargin + 24
            titleLabel.centerY == superview.centerY - 6
            
            locationLabel.leadingMargin == superview.leadingMargin + 24
            locationLabel.centerY == superview.centerY + 12
            
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
}
