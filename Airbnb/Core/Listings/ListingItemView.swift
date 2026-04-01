//
//  ListingItemView.swift
//  Airbnb
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    @State private var liked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image carousel with heart button overlay
            ZStack(alignment: .topTrailing) {
                ListingImageCarouselView(images: listing.images)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // Heart button
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.55)) {
                        liked.toggle()
                    }
                } label: {
                    Image(systemName: liked ? "heart.fill" : "heart")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(liked ? Color(red: 1, green: 0.22, blue: 0.37) : .white)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                }
                .padding(16)
            }

            // Info row
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(listing.title)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.primary)
                            .lineLimit(1)

                        Text(listing.location)
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray))

                        Text("May 12–17")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray))

                        HStack(spacing: 2) {
                            Text("$\(listing.price)")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.primary)
                            Text("night")
                                .font(.system(size: 15))
                                .foregroundColor(.primary)
                        }
                        .padding(.top, 2)
                    }

                    Spacer(minLength: 8)

                    // Star rating — top-right aligned
                    HStack(spacing: 3) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                        Text(String(format: "%.2f", listing.rating))
                            .font(.system(size: 14))
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.horizontal, 2)
            .padding(.top, 10)
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

#Preview {
    ListingItemView(listing: MockData.listings[0])
}
