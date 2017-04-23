//
//  health.swift
//  PrisonGame
//
//  Created by Ryan Bergstrom on 4/22/17.
//  Copyright © 2017 Ryan Bergstrom. All rights reserved.
//

import UIKit

class health {

    
    var DaysLeft: Int = 10000
    var DaysAtStart: Int = 8000
    
    var DaysLogged: Int = 0
    
    var SleepChange: Int = 1
    var Respect: Int = 0
    
    // We don't show this button until day 10
    var DaysShowPushups: Int = 10
    
    
    // Every time we sleep this gets called
    public func SleepOneNight(){
        DaysLeft -= SleepChange
        DaysLogged += SleepChange
    }
    
    
    
}
