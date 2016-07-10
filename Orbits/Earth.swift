//
//  Earth.swift
//  Orbits
//
//  Created by John Ahrens on 6/18/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

class Earth: Body
{
    init() {
        let mass = 5.97237e24 // kilograms
        let radius = 6378100.0 // meters, equatorial radius, since it's the largest
        let gm = 3.986004418e14 // gravitational constant * mass of Earth, in meters cubed / square root seconds
        
        super.init(withMass: mass, radius: radius, gm: gm)
    }
}