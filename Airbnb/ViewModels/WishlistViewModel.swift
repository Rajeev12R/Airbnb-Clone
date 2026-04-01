//
//  WishlistViewModel.swift
//  Airbnb
//
//  Created by Rajeev Ranjan on 01/04/26.
//

//
//  WishlistView.swift
//  Airbnb
//

//
//  WishlistViewModel.swift
//  Airbnb
//

//
//  WishlistViewModel.swift
//  Airbnb
//

import Foundation
import Combine

class WishlistViewModel: ObservableObject {
    @Published var wishlistedListings: [Listing] = []
    
    func addToWishlist(_ listing: Listing) {
        if !wishlistedListings.contains(where: { $0.id == listing.id }) {
            wishlistedListings.append(listing)
        }
    }
    
    func removeFromWishlist(_ listing: Listing) {
        wishlistedListings.removeAll { $0.id == listing.id }
    }
    
    func isWishlisted(_ listing: Listing) -> Bool {
        wishlistedListings.contains { $0.id == listing.id }
    }
}
