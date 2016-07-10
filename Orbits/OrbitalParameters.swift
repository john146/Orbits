//
//  OrbitalParameters.swift
//  Orbits
//
//  Created by John Ahrens on 6/18/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

/**
 * http://www.braeunig.us/space/orbmech.htm
 */
class OrbitalParameters
{
    let planet: Body
    let satellite: Satellite
    
    init(withPlanet: Body, satellite: Satellite)
    {
        self.planet = withPlanet
        self.satellite = satellite
    }
    
    func computePeriapsisAndApoapsisWith(radius: Distance,
                                       velocity: Velocity,
                                         zenith: Double) -> (periapsis: Double, apoapsis: Double)
    {
        let r1 = planet.radius + radius.altitude
        let sinZenith = sin(zenith)
        let C = (2.0 * planet.gm) / (r1 * velocity.speed * velocity.speed)
        let squareRoot = pow(C * C - 4 * (1 - C) * -(sinZenith * sinZenith), 0.5)
        let root1 = ((-C - squareRoot) / (2 * (1.0 - C))) * r1
        let root2 = ((-C + squareRoot) / (2 * (1.0 - C))) * r1
        var periapsis = 0.0
        var apoapsis = 0.0
        if root1 < root2 {
            periapsis = root1
            apoapsis = root2
        } else {
            periapsis = root2
            apoapsis = root1
        }
        
        return (periapsis, apoapsis)
    }
}