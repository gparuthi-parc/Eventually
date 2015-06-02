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
        self.backgroundColor = UIColor.headerBackgroundColor()

        self.addSubview(titleView)
        titleView.backgroundColor = UIColor.whiteColor()
        self.addInformationLabels(titleView)
    }
    
    // not a particullarly reuseable function, but still useful for grouping
    func addInformationLabels(view: UIView) {
        view.addLabelToView(titleLabel, fontName: UIFont.appFont(.Light), fontSize: 24, textColor: UIColor.primaryTextColor())
        self.titleLabel.text = "This is an Event"
        
        view.addLabelToView(dayLabel, fontName: UIFont.appFont(.Light), fontSize: 16, textColor: UIColor.primaryTextColor())
        self.dayLabel.text = "Tuesday, August 25"
        
        view.addLabelToView(locationLabel, fontName: UIFont.appFont(.Light), fontSize: 16, textColor: UIColor.primaryTextColor())
        self.locationLabel.text = "101 Arch Stree, Boston"
        
        constrain(titleLabel, dayLabel, locationLabel) { titleLabel, dayLabel, locationLabel in
            let superview = titleLabel.superview!

            titleLabel.leadingMargin == superview.leadingMargin + 24
            titleLabel.centerYWithinMargins == superview.topMargin + 24
            
            dayLabel.leadingMargin == superview.leadingMargin + 24
            dayLabel.topMargin == titleLabel.bottomMargin
            
            locationLabel.leadingMargin == superview.leadingMargin + 24
            locationLabel.topMargin == dayLabel.bottomMargin + 5
        }
    }
}
