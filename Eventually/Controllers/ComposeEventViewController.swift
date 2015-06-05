//
//  ComposeEventViewController.swift
//  Eventually
//
//  Created by David Barsky on 6/4/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import UIKit

class ComposeEventViewController: UIViewController {
    
    
    @IBAction func cancelButtonWasPressed(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonWasPressed(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
