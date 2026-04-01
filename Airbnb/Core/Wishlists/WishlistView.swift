//
//  WishlistView.swift
//  Airbnb
//

import SwiftUI

struct WishlistView: View {
    @StateObject private var viewModel = WishlistViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.wishlistedListings.isEmpty {
                VStack(spacing: 16) {
                    Spacer()

                    Image(systemName: "heart")
                        .font(.system(size: 48))
                        .foregroundColor(.primary)

                    Text("Create your first wishlist")
                        .font(.system(size: 22, weight: .semibold))

                    Text("As you search, tap the heart icon to save your favorite places and Experiences to a wishlist.")
                        .font(.system(size: 15))
                        .foregroundColor(Color(.systemGray))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 48)

                    Spacer()
                }
                .navigationTitle("Wishlists")
                .navigationBarTitleDisplayMode(.large)
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)],
                        spacing: 20
                    ) {
                        ForEach(viewModel.wishlistedListings) { listing in
                            NavigationLink {
                                ListingDetailView(listing: listing)
                            } label: {
                                WishlistCard(listing: listing)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 20)
                }
                .navigationTitle("Wishlists")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

struct WishlistCard: View {
    let listing: Listing

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            if let first = listing.images.first {
                Image(first)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(alignment: .bottomLeading) {
                        // count badge
                        if listing.images.count > 1 {
                            Text("\(listing.images.count) photos")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                                .padding(8)
                        }
                    }
            }

            Text(listing.title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.primary)
                .lineLimit(2)

            Text("$\(listing.price) night")
                .font(.system(size: 12))
                .foregroundColor(Color(.systemGray))
        }
    }
}

#Preview {
    WishlistView()
}
