//
//  Satellite.swift
//  Orbits
//
//  Created by John Ahrens on 6/18/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

class Satellite
{
    let initialRadius: Double // Distance from the center of the planet (Body), in meters
    let initialVelocity: Double // Speed of spacecraft at initial point, in meters/second
    let initialZenithAngle: Double // The angle between the position and velocity vectors, in radians
    
    init(withRadius: Double, velocity: Double, zenithAngle: Double)
    {
        self.initialRadius = withRadius
        self.initialVelocity = velocity
        self.initialZenithAngle = zenithAngle
    }
}