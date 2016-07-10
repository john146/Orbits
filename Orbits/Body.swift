//
//  Body.swift
//  Orbits
//
//  Created by John Ahrens on 6/18/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

class Body
{
    let mass: Double // in kilograms
    let radius: Double // Of body, in meters
    let gm: Double // Universal Gravitational constant * mass of Body, in meters cubed / seconds squared
    
    init(withMass mass: Double, radius: Double, gm: Double)
    {
        self.mass = mass
        self.radius = radius
        self.gm = gm
    }
}