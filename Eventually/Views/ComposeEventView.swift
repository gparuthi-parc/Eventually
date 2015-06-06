//
//  ComposeEventView.swift
//  Eventually
//
//  Created by David Barsky on 6/4/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit
import Cartography

@IBDesignable
class ComposeEventView: UIView {

    let titleInput = UITextField()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.headerBackgroundColor()

        self.addSubview(titleInput)
        titleInput.placeholder = "Event Title..."
        titleInput.font = UIFont(name: UIFont.appFont(.Light), size: 18)
        constrain(titleInput) { titleInput in
            let superview = titleInput.superview!

            titleInput.top == superview.topMargin + 100
            titleInput.leadingMargin == superview.leadingMargin
            titleInput.trailingMargin == superview.trailingMargin
        }
    }
}
