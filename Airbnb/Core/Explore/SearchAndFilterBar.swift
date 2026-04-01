//
//  SearchAndFilterBar.swift
//  Airbnb
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var showDestinationSearch: Bool

    var body: some View {
        HStack(spacing: 12) {
            // Main search pill
            Button {
                withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                    showDestinationSearch = true
                }
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)

                    VStack(alignment: .leading, spacing: 1) {
                        Text("Where to?")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)

                        Text("Anywhere · Any week · Add guests")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.systemGray))
                    }

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color(.systemBackground))
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 2)
                .overlay(
                    Capsule()
                        .stroke(Color(.systemGray5), lineWidth: 0.5)
                )
            }
            .buttonStyle(ScaleButtonStyle())

            // Filter button
            Button {
                // show filters
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(width: 42, height: 42)
                    .background(Color(.systemBackground))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
                    .overlay(
                        Circle()
                            .stroke(Color(.systemGray5), lineWidth: 0.5)
                    )
            }
        }
        .padding(.horizontal, 24)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

#Preview {
    SearchAndFilterBar(showDestinationSearch: .constant(false))
}
