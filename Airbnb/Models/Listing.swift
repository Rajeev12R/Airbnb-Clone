//
//  Listing.swift
//  Airbnb
//
//  Created by Rajeev Ranjan on 01/04/26.
//

// Models/Listing.swift
//
//  Listing.swift
//  Airbnb
//
//
//  Listing.swift
//  Airbnb
//

import Foundation
import CoreLocation

struct Listing: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let location: String
    let coordinate: CLLocationCoordinate2D
    let price: Int
    let rating: Double
    let images: [String]
    let amenities: [Amenity]
    let hostName: String
    let hostImage: String
    let bedrooms: Int
    let beds: Int
    let baths: Int
    let maxGuests: Int
    
    // Computed properties for formatted display
    var formattedPrice: String {
        return "$\(price) night"
    }
    
    var guestInfo: String {
        return "\(maxGuests) guests · \(bedrooms) bedrooms · \(beds) beds · \(baths) baths"
    }
    
    init(title: String, location: String, coordinate: CLLocationCoordinate2D, price: Int, rating: Double, images: [String], amenities: [Amenity], hostName: String = "John", hostImage: String = "person.circle.fill", bedrooms: Int = 2, beds: Int = 2, baths: Int = 2, maxGuests: Int = 4) {
        self.title = title
        self.location = location
        self.coordinate = coordinate
        self.price = price
        self.rating = rating
        self.images = images
        self.amenities = amenities
        self.hostName = hostName
        self.hostImage = hostImage
        self.bedrooms = bedrooms
        self.beds = beds
        self.baths = baths
        self.maxGuests = maxGuests
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Listing, rhs: Listing) -> Bool {
        lhs.id == rhs.id
    }
}
