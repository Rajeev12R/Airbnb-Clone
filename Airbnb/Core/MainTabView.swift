//
//  MainTabView.swift
//  Airbnb
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "magnifyingglass" : "magnifyingglass")
                        Text("Explore")
                    }
                }
                .tag(0)

            WishlistView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "heart.fill" : "heart")
                        Text("Wishlists")
                    }
                }
                .tag(1)

            TripsView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 2 ? "airplane.circle.fill" : "airplane.circle")
                        Text("Trips")
                    }
                }
                .tag(2)

            MessagesView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "message.fill" : "message")
                        Text("Inbox")
                    }
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        Text("Profile")
                    }
                }
                .tag(4)
        }
        .tint(Color(red: 1, green: 0.22, blue: 0.37))
    }
}

// MARK: - Placeholder screens

struct TripsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer()
                Image(systemName: "airplane.departure")
                    .font(.system(size: 48))
                    .foregroundColor(.primary)
                Text("No trips booked...yet!")
                    .font(.system(size: 22, weight: .semibold))
                Text("Time to dust off your bags and start planning your next adventure.")
                    .font(.system(size: 15))
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 48)
                Spacer()
            }
            .navigationTitle("Trips")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MessagesView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer()
                Image(systemName: "message")
                    .font(.system(size: 48))
                    .foregroundColor(.primary)
                Text("No messages")
                    .font(.system(size: 22, weight: .semibold))
                Text("When you book a trip or contact a host, you'll see your messages here.")
                    .font(.system(size: 15))
                    .foregroundColor(Color(.systemGray))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 48)
                Spacer()
            }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MainTabView()
}
