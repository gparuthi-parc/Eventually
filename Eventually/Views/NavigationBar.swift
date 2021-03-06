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
        self.tintColor = UIColor.primaryTextColor()
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.shadowImage = UIImage()
        self.addBottomBorderWithHeight(1, color: UIColor.borderColor(), leftOffset: 0, rightOffset: 0, bottomOffset: -1)
    }
}
