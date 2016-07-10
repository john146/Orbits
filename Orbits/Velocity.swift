//
//  Velocity.swift
//  Orbits
//
//  Created by John Ahrens on 7/3/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

class Velocity
{
    var horizontal: Double // Speed normal to the radius
    var vertical: Double // Speed tangential to the radius
    var speed: Double // Total speed
    
    init(withHorizontal: Double, vertical: Double)
    {
        self.horizontal = withHorizontal
        self.vertical = vertical
        self.speed = pow(self.horizontal * self.horizontal + self.vertical * self.vertical, 0.5) // Apply Pythagoreus
    }
}