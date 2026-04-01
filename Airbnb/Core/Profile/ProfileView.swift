//
//  ProfileView.swift
//  Airbnb
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                // Profile header
                Section {
                    HStack(spacing: 16) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 72))
                                .foregroundColor(Color(.systemGray3))

                            Image(systemName: "pencil.circle.fill")
                                .font(.system(size: 22))
                                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.37))
                                .background(Circle().fill(Color(.systemBackground)).frame(width: 24, height: 24))
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text("John Doe")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Show profile")
                                .font(.system(size: 14))
                                .foregroundColor(.primary)
                                .underline()
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 13))
                            .foregroundColor(Color(.systemGray3))
                    }
                    .padding(.vertical, 8)
                }

                // Hosting
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Airbnb your home")
                                    .font(.system(size: 15, weight: .semibold))
                                Text("It's simple to start earning and Airbnb is always here to help.")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(.systemGray))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer()
                            Image(systemName: "house.fill")
                                .font(.system(size: 28))
                                .foregroundColor(Color(red: 1, green: 0.22, blue: 0.37))
                        }
                        .padding(.vertical, 4)
                    }
                }

                // Settings
                Section("Settings") {
                    ProfileRow(icon: "person", title: "Personal info")
                    ProfileRow(icon: "bell", title: "Notifications")
                    ProfileRow(icon: "lock.shield", title: "Privacy and sharing")
                    ProfileRow(icon: "globe", title: "Translation")
                    ProfileRow(icon: "creditcard", title: "Payments and payouts")
                    ProfileRow(icon: "slider.horizontal.3", title: "Accessibility")
                    ProfileRow(icon: "tax", title: "Taxes")
                }

                // Support
                Section("Support") {
                    ProfileRow(icon: "questionmark.circle", title: "Get help")
                    ProfileRow(icon: "ant", title: "Report a bug")
                    ProfileRow(icon: "doc.text", title: "Terms of Service")
                    ProfileRow(icon: "hand.raised", title: "Privacy Policy")
                }

                // Sign out
                Section {
                    Button {
                        // Sign out action
                    } label: {
                        Text("Log out")
                            .font(.system(size: 15))
                            .foregroundColor(.primary)
                    }
                }

                Section {
                    Text("v2.1 (240401)")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.systemGray3))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ProfileRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundColor(.primary)
                .frame(width: 24)

            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 13))
                .foregroundColor(Color(.systemGray3))
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ProfileView()
}
