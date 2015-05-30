//
//  Toolbar.swift
//  Eventually
//
//  Created by David Barsky on 5/28/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

@IBDesignable
class Toolbar: UIToolbar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.barTintColor = UIColor.headerBackgroundColor()
        self.tintColor = UIColor.primaryTextColor()
        self.clipsToBounds = true
        
        self.addTopBorderWithHeight(1, color: UIColor.borderColor())
    }
}
