//
//  Distance.swift
//  Orbits
//
//  Created by John Ahrens on 7/3/16.
//  Copyright © 2016 John Ahrens. All rights reserved.
//

import Foundation

class Distance
{
    var latitude: Double // 0-90 degrees, + North
    var longitude: Double // 0-180 degrees, + East
    var altitude: Double // Height above mean body surface, in meters
    
    init(withLatitude: Double, longitude: Double, altitude: Double)
    {
        self.latitude = withLatitude
        self.longitude = longitude
        self.altitude = altitude
    }
}