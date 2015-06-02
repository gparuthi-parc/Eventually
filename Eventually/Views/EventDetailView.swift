//
//  EventDetailView.swift
//  Eventually
//
//  Created by David Barsky on 5/31/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import EventKit
import Cartography

@IBDesignable
class EventDetailView: UIView {
    
    let data = Int()
    
    let titleLabel = UILabel()
    let dayLabel = UILabel()
    let timeLabel = UILabel()
    
    let locationLabel = UILabel()
    let attendeesLabel = UILabel()
    
    // grouping views
    
    let titleView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        println("things are called")
        
        self.backgroundColor = UIColor.headerBackgroundColor()
        self.addLabelToView(titleLabel, fontName: UIFont.appFont(.Light), fontSize: 24, textColor: UIColor.primaryTextColor())
        self.titleLabel.text = "This is an Event"
        
        self.addLabelToView(dayLabel, fontName: UIFont.appFont(.Regular), fontSize: 16, textColor: UIColor.primaryTextColor())
        self.dayLabel.text = "Tuesday, August 25"

        // labels in TitleView
        constrain(titleLabel, dayLabel, locationLabel) { titleLabel, dayLabel, locationLabel in
            let superview = titleLabel.superview!

            titleLabel.leadingMargin == superview.leadingMargin + 24
            titleLabel.centerYWithinMargins == superview.topMargin + 24
        }
    }
}
