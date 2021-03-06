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
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let locationLabel = UILabel()
    let calendarIndicator = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.whiteColor()
        
        self.addLabelToView(titleLabel, fontName: UIFont.appFont(.Light), fontSize: 16, textColor: UIColor.primaryTextColor())
        self.addLabelToView(locationLabel, fontName: UIFont.appFont(.Light), fontSize: 13, textColor: UIColor.primaryTextColor())
        self.addLabelToView(dateLabel, fontName: UIFont.appFont(.Light), fontSize: 13, textColor: UIColor.primaryTextColor())
        self.addCalendarIndicatorToCell(calendarIndicator, color: UIColor(red:0.004,  green:0.553,  blue:1, alpha:1))
        
        constrain(titleLabel, locationLabel, dateLabel) { titleLabel, locationLabel, dateLabel in
            let superview = titleLabel.superview!
            
            titleLabel.leadingMargin == superview.leadingMargin + 24
            titleLabel.centerY == superview.centerY - 5
            
            locationLabel.leadingMargin == superview.leadingMargin + 24
            locationLabel.centerY == superview.centerY + 11
            
            dateLabel.trailingMargin == superview.trailingMargin - 12
            dateLabel.baseline == titleLabel.baseline
        }
        
        constrain(calendarIndicator) { calendarIndicator in
            let superview = calendarIndicator.superview!
            
            calendarIndicator.width == 8
            calendarIndicator.height == 8
            calendarIndicator.centerX == superview.leadingMargin + 5
            calendarIndicator.centerY == superview.centerY
        }
    }
    
    // MARK: - Specialized Initializers
    
    // is called from events view controller. better if it belongs in the view model.
    func addBorderToCell() {
        self.addBottomBorderWithHeight(1, color: UIColor.borderColor(), leftOffset: 24, rightOffset: 0, bottomOffset: 0)
    }
    
    func addCalendarIndicatorToCell(indicator: UIView, color: UIColor) {
        self.addSubview(indicator)
        indicator.backgroundColor = color
        indicator.layer.cornerRadius = 4
    }
}
