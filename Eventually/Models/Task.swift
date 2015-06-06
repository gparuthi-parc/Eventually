//
//  Task.swift
//  Eventually
//
//  Created by David Barsky on 6/5/15.
//  Copyright (c) 2015 David Barsky. All rights reserved.
//

import Realm

class Task : RLMObject {
    dynamic var name = ""
    dynamic var note = ""
    dynamic var status = false
}
