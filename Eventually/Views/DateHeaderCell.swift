//
//  DateHeaderView.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import Cartography

class DateHeaderCell: UICollectionReusableView {
    
    var dateLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(dateLabel)
        self.addLabelToCell(dateLabel, fontName: "AktivGroteskTrial-LightItalic", fontSize: 14, textColor: UIColor.headerTextColor())
        self.backgroundColor = UIColor.headerBackgroundColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0.888,  green:0.892,  blue:0.92, alpha:1).CGColor
        
        layout(dateLabel) { dateLabel in
            let superview = dateLabel.superview!

            dateLabel.centerY == superview.centerY + 4
            dateLabel.leadingMargin == superview.leadingMargin + 24
        }
    }
}
