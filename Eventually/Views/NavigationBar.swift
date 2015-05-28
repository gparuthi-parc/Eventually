//
//  NavigationBar.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

@IBDesignable
class NavigationBar: UINavigationBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.barTintColor = UIColor.headerBackgroundColor()
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }
}
