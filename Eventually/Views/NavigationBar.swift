//
//  NavigationBar.swift
//  Eventually
//
//  Created by David Barsky on 5/27/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.barTintColor = UIColor(red:0.957,  green:0.957,  blue:0.973, alpha:1)
    }
}