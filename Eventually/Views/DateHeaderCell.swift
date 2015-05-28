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
        self.addLabelToCell(dateLabel, fontName: "AktivGroteskTrial-Light", fontSize: 14, textColor: UIColor.headerTextColor())
        self.backgroundColor = UIColor.headerBackgroundColor()
        
        self.addBottomBorderWithHeight(1, color: UIColor.borderColor())
        self.addTopBorderWithHeight(1, color: UIColor.borderColor())
        
        layout(dateLabel) { dateLabel in
            let superview = dateLabel.superview!

            dateLabel.centerY == superview.centerY + 3
            dateLabel.leadingMargin == superview.leadingMargin + 24
        }
    }
}
