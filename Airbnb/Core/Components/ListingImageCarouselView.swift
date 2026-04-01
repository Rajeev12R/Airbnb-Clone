//
//  ListingImageCarouselView.swift
//  Airbnb
//

import SwiftUI

struct ListingImageCarouselView: View {
    let images: [String]
    @State private var currentIndex = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                        .clipped()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            // Dot indicator
            if images.count > 1 {
                HStack(spacing: 6) {
                    ForEach(images.indices, id: \.self) { index in
                        Circle()
                            .fill(currentIndex == index ? Color.white : Color.white.opacity(0.55))
                            .frame(
                                width: currentIndex == index ? 7 : 5,
                                height: currentIndex == index ? 7 : 5
                            )
                            .animation(.easeInOut(duration: 0.2), value: currentIndex)
                    }
                }
                .padding(.bottom, 14)
            }
        }
    }
}

#Preview {
    ListingImageCarouselView(images: ["listing-1", "listing-2", "listing-3"])
        .frame(height: 320)
}
