//
//  OrbitalParametersTests.swift
//  Orbits
//
//  Created by John Ahrens on 6/18/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import XCTest

class OrbitalParametersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func computeCWith(_ gm: Double, radius: Double, velocity: Double) -> Double
    {
        let c = (2 * gm) / (radius * velocity * velocity)
        return c
    }

    func testZeroVelocity() {
        let altitude = 200000.0 // meters
        let speed = 30000000.0 / 3600.0 // meters/second
        let initialDistance = Distance(withLatitude: 0.0, longitude: 0.0, altitude: altitude)
        let initialVelocity = Velocity(withHorizontal: speed, vertical: 0.0)
        
        let earth = Earth()
        let satellite = Satellite(withRadius: altitude, velocity: speed, zenithAngle: M_PI / 2.0)
        
        let orbit = OrbitalParameters(withPlanet: earth, satellite: satellite)
        
        var periapsis = 0.0
        var apoapsis = 0.0
        let zenithAngle = M_PI / 2.0
        (periapsis, apoapsis) = orbit.computePeriapsisAndApoapsisWith(initialDistance,
                                                                      velocity: initialVelocity,
                                                                        zenith: zenithAngle)
        
        let initialRadius = altitude + earth.radius
        let C = computeCWith(earth.gm, radius: initialRadius, velocity: speed)
        let oneMinusC = 1.0 - C
        let denominator = 2 * oneMinusC
        let sinZenith = sin(zenithAngle)
        let root = pow(C * C - 4 * oneMinusC * -(sinZenith * sinZenith), 0.5)
        let expectedPeriapsis = ((-C + root) / denominator) * initialRadius
        XCTAssertEqual(expectedPeriapsis, periapsis)
        let expectedApoapsis = ((-C - root) / denominator) * initialRadius
        XCTAssertEqual(expectedApoapsis, apoapsis)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
