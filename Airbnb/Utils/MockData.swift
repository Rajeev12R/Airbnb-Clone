//
//  MockData.swift
//  Airbnb
//
//  Created by Rajeev Ranjan on 01/04/26.
//
// Utils/MockData.swift
//
//  MockData.swift
//  Airbnb
//
//
//  MockData.swift
//  Airbnb
//

import Foundation
import CoreLocation

class MockData {
    static let listings: [Listing] = [
        Listing(
            title: "Luxury Miami Beachfront Villa",
            location: "Miami Beach, Florida",
            coordinate: CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918),
            price: 567,
            rating: 4.92,
            images: ["listing-1", "listing-2", "listing-3", "listing-4"],
            amenities: [.wifi, .pool, .kitchen, .parking],
            hostName: "Sophia",
            hostImage: "person.circle.fill",
            bedrooms: 4,
            beds: 5,
            baths: 3,
            maxGuests: 8
        ),
        Listing(
            title: "Modern Beach House with Ocean View",
            location: "Malibu, California",
            coordinate: CLLocationCoordinate2D(latitude: 34.0259, longitude: -118.7798),
            price: 420,
            rating: 4.85,
            images: ["listing-2", "listing-3", "listing-4", "listing-1"],
            amenities: [.wifi, .parking, .kitchen],
            hostName: "Michael",
            hostImage: "person.circle.fill",
            bedrooms: 3,
            beds: 3,
            baths: 2,
            maxGuests: 6
        ),
        Listing(
            title: "Cozy Mountain Cabin with Hot Tub",
            location: "Aspen, Colorado",
            coordinate: CLLocationCoordinate2D(latitude: 39.1911, longitude: -106.8175),
            price: 300,
            rating: 4.95,
            images: ["listing-3", "listing-4", "listing-1", "listing-2"],
            amenities: [.wifi, .kitchen, .pool],
            hostName: "Emma",
            hostImage: "person.circle.fill",
            bedrooms: 2,
            beds: 2,
            baths: 1,
            maxGuests: 4
        ),
        Listing(
            title: "Luxury Downtown Loft",
            location: "Manhattan, New York",
            coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
            price: 350,
            rating: 4.78,
            images: ["listing-4", "listing-1", "listing-2", "listing-3"],
            amenities: [.wifi, .kitchen],
            hostName: "David",
            hostImage: "person.circle.fill",
            bedrooms: 1,
            beds: 1,
            baths: 1,
            maxGuests: 2
        )
    ]
}
