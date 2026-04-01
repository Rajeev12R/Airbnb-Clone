//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Rajeev Ranjan on 01/04/26.
//
//
//  ExploreViewModel.swift
//  Airbnb
//

//
//  ExploreViewModel.swift
//  Airbnb
//

import Foundation
import Combine

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var listings = MockData.listings
    @Published var searchText = ""
    @Published var selectedCategory: Category = .trending
    @Published var isLoading = false
    
    var filteredListings: [Listing] {
        var filtered = listings
        
        if !searchText.isEmpty {
            filtered = filtered.filter {
                $0.location.lowercased().contains(searchText.lowercased()) ||
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
        
        // Filter by category (mock implementation)
        if selectedCategory != .trending {
            // In a real app, you'd filter by actual category
            // This is just for demonstration
            filtered = filtered.filter { _ in true }
        }
        
        return filtered
    }
    
    func refreshListings() async {
        isLoading = true
        // Simulate network request
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        listings = MockData.listings
        isLoading = false
    }
}
