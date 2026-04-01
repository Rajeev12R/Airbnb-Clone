//
//  ListingDetailView.swift
//  Airbnb
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    @State private var region: MKCoordinateRegion
    @State private var showBookingSheet = false
    @State private var scrollOffset: CGFloat = 0

    init(listing: Listing) {
        self.listing = listing
        _region = State(initialValue: MKCoordinateRegion(
            center: listing.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // Full-bleed image carousel
                    ListingImageCarouselView(images: listing.images)
                        .frame(height: 360)
                        .overlay(alignment: .topLeading) {
                            Button { dismiss() } label: {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 36, height: 36)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 2)
                            }
                            .padding(.top, 60)
                            .padding(.leading, 20)
                        }
                        .overlay(alignment: .topTrailing) {
                            HStack(spacing: 12) {
                                Button {} label: {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 36, height: 36)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .shadow(color: .black.opacity(0.15), radius: 6)
                                }
                                Button {} label: {
                                    Image(systemName: "heart")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 36, height: 36)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .shadow(color: .black.opacity(0.15), radius: 6)
                                }
                            }
                            .padding(.top, 60)
                            .padding(.trailing, 20)
                        }

                    VStack(alignment: .leading, spacing: 0) {
                        // Title section
                        VStack(alignment: .leading, spacing: 6) {
                            Text(listing.title)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(.primary)

                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.primary)
                                Text(String(format: "%.2f", listing.rating))
                                    .font(.system(size: 14, weight: .semibold))
                                Text("·")
                                    .foregroundColor(Color(.systemGray3))
                                Text("28 reviews")
                                    .font(.system(size: 14))
                                    .underline()
                                Text("·")
                                    .foregroundColor(Color(.systemGray3))
                                Image(systemName: "medal.fill")
                                    .font(.system(size: 12))
                                Text("Superhost")
                                    .font(.system(size: 14))
                                    .underline()
                            }
                            .foregroundColor(.primary)

                            Text(listing.location)
                                .font(.system(size: 14))
                                .foregroundColor(.primary)
                                .underline()
                                .padding(.top, 2)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        .padding(.bottom, 20)

                        dividerLine

                        // Host row
                        HStack(spacing: 14) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Entire villa hosted by \(listing.hostName)")
                                    .font(.system(size: 17, weight: .semibold))
                                Text("\(listing.maxGuests) guests · \(listing.bedrooms) bedrooms · \(listing.beds) beds · \(listing.baths) baths")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.systemGray))
                            }
                            Spacer()
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 52))
                                .foregroundColor(Color(.systemGray3))
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)

                        dividerLine

                        // Highlights (Airbnb-style feature rows)
                        VStack(spacing: 0) {
                            HighlightRow(icon: "medal.fill", title: "\(listing.hostName) is a Superhost", subtitle: "Superhosts are experienced, highly rated hosts.")
                            HighlightRow(icon: "location.fill", title: "Great location", subtitle: "100% of recent guests gave the location 5 stars.")
                            HighlightRow(icon: "key.fill", title: "Great check-in experience", subtitle: "100% of recent guests gave the check-in process 5 stars.")
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)

                        dividerLine

                        // Description
                        VStack(alignment: .leading, spacing: 12) {
                            Text("About this place")
                                .font(.system(size: 17, weight: .semibold))
                            Text("Welcome to this stunning property. Enjoy breathtaking views, premium amenities, and the ultimate in comfort and luxury. Perfect for families, groups, or a romantic getaway.")
                                .font(.system(size: 15))
                                .foregroundColor(Color(.systemGray))
                                .lineSpacing(4)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)

                        dividerLine

                        // Amenities
                        VStack(alignment: .leading, spacing: 16) {
                            Text("What this place offers")
                                .font(.system(size: 17, weight: .semibold))

                            VStack(spacing: 0) {
                                ForEach(listing.amenities, id: \.self) { amenity in
                                    HStack(spacing: 16) {
                                        Image(systemName: amenity.iconName)
                                            .font(.system(size: 20))
                                            .foregroundColor(.primary)
                                            .frame(width: 28)
                                        Text(amenity.rawValue.capitalized)
                                            .font(.system(size: 16))
                                        Spacer()
                                    }
                                    .padding(.vertical, 12)
                                    if amenity != listing.amenities.last {
                                        Divider()
                                    }
                                }
                            }

                            Button {} label: {
                                Text("Show all \(listing.amenities.count + 8) amenities")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(Color(.systemBackground))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(.systemGray3), lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)

                        dividerLine

                        // Map section
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Where you'll be")
                                .font(.system(size: 17, weight: .semibold))

                            Map(coordinateRegion: $region, interactionModes: .all)
                                .frame(height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 16))

                            Text(listing.location)
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)

                        // Bottom padding to clear sticky footer
                        Color.clear.frame(height: 100)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

            // ── Sticky booking footer ──────────────────────────────
            VStack(spacing: 0) {
                Divider()
                HStack(alignment: .center, spacing: 0) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 2) {
                            Text("$\(listing.price)")
                                .font(.system(size: 18, weight: .bold))
                            Text("night")
                                .font(.system(size: 16))
                        }
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 11))
                            Text(String(format: "%.2f", listing.rating))
                                .font(.system(size: 12))
                            Text("· 28 reviews")
                                .font(.system(size: 12))
                                .foregroundColor(Color(.systemGray))
                        }
                    }

                    Spacer()

                    Button {
                        showBookingSheet = true
                    } label: {
                        Text("Reserve")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 28)
                            .padding(.vertical, 14)
                            .background(
                                LinearGradient(
                                    colors: [Color(red: 0.9, green: 0.1, blue: 0.4), Color(red: 1, green: 0.22, blue: 0.37)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .background(Color(.systemBackground))
            }
        }
        .sheet(isPresented: $showBookingSheet) {
            BookingView(listing: listing)
        }
    }

    var dividerLine: some View {
        Divider()
            .padding(.horizontal, 24)
    }
}

// MARK: - Highlight row

struct HighlightRow: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.primary)
                .frame(width: 30)
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(Color(.systemGray))
            }

            Spacer()
        }
        .padding(.vertical, 12)
    }
}

// MARK: - Booking sheet

struct BookingView: View {
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    @State private var checkIn = Date()
    @State private var checkOut = Date().addingTimeInterval(86400 * 5)
    @State private var guests = 1

    var nights: Int {
        max(1, Calendar.current.dateComponents([.day], from: checkIn, to: checkOut).day ?? 1)
    }
    var totalPrice: Int { listing.price * nights }
    var serviceFee: Int { Int(Double(totalPrice) * 0.14) }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Price header
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("$\(listing.price)")
                            .font(.system(size: 22, weight: .bold))
                        Text("night")
                            .font(.system(size: 16))
                            .padding(.bottom, 2)
                        Spacer()
                        HStack(spacing: 3) {
                            Image(systemName: "star.fill").font(.system(size: 12))
                            Text(String(format: "%.2f", listing.rating)).font(.system(size: 14))
                            Text("· 28 reviews").font(.system(size: 13)).foregroundColor(Color(.systemGray))
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    // Date and guest picker
                    VStack(spacing: 0) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("CHECK-IN")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.systemGray))
                                DatePicker("", selection: $checkIn, displayedComponents: .date)
                                    .labelsHidden()
                            }
                            Divider().frame(height: 44)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("CHECKOUT")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.systemGray))
                                DatePicker("", selection: $checkOut, displayedComponents: .date)
                                    .labelsHidden()
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)

                        Divider().padding(.horizontal, 16)

                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("GUESTS")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.systemGray))
                                Text("\(guests) guest\(guests > 1 ? "s" : "")")
                                    .font(.system(size: 15))
                            }
                            Spacer()
                            Stepper("", value: $guests, in: 1...listing.maxGuests)
                                .labelsHidden()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .padding(.horizontal, 24)

                    // Reserve button
                    Button {
                        dismiss()
                    } label: {
                        Text("Reserve")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color(red: 1, green: 0.22, blue: 0.37))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)

                    Text("You won't be charged yet")
                        .font(.system(size: 13))
                        .foregroundColor(Color(.systemGray))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)

                    // Price breakdown
                    VStack(spacing: 16) {
                        Divider().padding(.top, 8)

                        HStack {
                            Text("$\(listing.price) × \(nights) nights")
                                .font(.system(size: 15))
                            Spacer()
                            Text("$\(totalPrice)")
                                .font(.system(size: 15))
                        }
                        HStack {
                            Text("Airbnb service fee")
                                .font(.system(size: 15))
                            Spacer()
                            Text("$\(serviceFee)")
                                .font(.system(size: 15))
                        }
                        Divider()
                        HStack {
                            Text("Total before taxes")
                                .font(.system(size: 15, weight: .semibold))
                            Spacer()
                            Text("$\(totalPrice + serviceFee)")
                                .font(.system(size: 15, weight: .semibold))
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 4)
                }
            }
            .navigationTitle("Request to book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListingDetailView(listing: MockData.listings[0])
    }
}
