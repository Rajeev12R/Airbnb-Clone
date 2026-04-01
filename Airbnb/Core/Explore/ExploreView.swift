//
//  ExploreView.swift
//  Airbnb
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var viewModel = ExploreViewModel()
    @State private var showDestinationSearch = false
    
    var body: some View {
        NavigationStack {
            if showDestinationSearch {
                DestinationSearchView(show: $showDestinationSearch, viewModel: viewModel)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.filteredListings) { listing in
                            NavigationLink(destination: ListingDetailView(listing: listing)) {
                                ListingItemView(listing: listing)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Divider()
                                .padding(.horizontal, 24)
                        }
                    }
                }
                .background(Color(.systemBackground))
                
                // ✅ Proper top header (no hacks)
                .safeAreaInset(edge: .top) {
                    headerView
                        .background(Color(.systemBackground))
                }
                
                .navigationBarHidden(true)
            }
        }
    }
}

// MARK: - Header View

extension ExploreView {
    
    private var headerView: some View {
        VStack(spacing: 0) {
            
            // Search Bar
            SearchAndFilterBar(showDestinationSearch: $showDestinationSearch)
                .padding(.top, 8)
                .padding(.bottom, 4)
            
            // Categories
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 28) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryButton(
                            category: category,
                            isSelected: viewModel.selectedCategory == category
                        ) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                viewModel.selectedCategory = category
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.vertical, 10)
            
            Divider()
        }
    }
}

// MARK: - Category Button

struct CategoryButton: View {
    
    let category: Category
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                
                Image(systemName: category.icon)
                    .font(.system(size: 22))
                    .foregroundColor(isSelected ? .primary : Color(.systemGray2))
                
                Text(category.rawValue)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(isSelected ? .primary : Color(.systemGray2))
            }
            .padding(.bottom, 4)
            .overlay(alignment: .bottom) {
                if isSelected {
                    Rectangle()
                        .fill(Color.primary)
                        .frame(height: 2)
                        .offset(y: 4)
                }
            }
        }
    }
}

// MARK: - Category Enum

enum Category: String, CaseIterable {
    case trending   = "Trending"
    case beaches    = "Beaches"
    case mountains  = "Mountains"
    case cities     = "Cities"
    case cabins     = "Cabins"
    
    var icon: String {
        switch self {
        case .trending:   return "flame.fill"
        case .beaches:    return "beach.umbrella.fill"
        case .mountains:  return "mountain.2.fill"
        case .cities:     return "building.2.fill"
        case .cabins:     return "house.fill"
        }
    }
}

// MARK: - Preview

#Preview {
    ExploreView()
}
