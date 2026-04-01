//
//  Amenity.swift
//  Airbnb
//
//  Created by Rajeev Ranjan on 01/04/26.
//
//
//  Amenity.swift
//  Airbnb
//

import Foundation

enum Amenity: String, CaseIterable {
    case wifi = "wifi"
    case kitchen = "kitchen"
    case parking = "parking"
    case pool = "pool"
    
    var iconName: String {
        switch self {
        case .wifi:
            return "wifi"
        case .kitchen:
            return "fork.knife"
        case .parking:
            return "car"
        case .pool:
            return "drop.fill"
        }
    }
}
