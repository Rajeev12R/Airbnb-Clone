//
//  DestinationSearchView.swift
//  Airbnb
//

import SwiftUI

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
    @State private var destination = ""
    @State private var selectedDate = Date()
    @State private var guests = 1
    @State private var selectedOption: SearchOption = .location
    
    enum SearchOption {
        case location, dates, guests
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Top Section (FIXED)
            
            VStack(spacing: 12) {
                
                // X button (LEFT)
                HStack {
                    Button {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            show = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.primary)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemBackground))
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color(.systemGray4), lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                // Tabs (CENTERED)
                HStack(spacing: 24) {
                    Text("Stays")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Text("Experiences")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
                    
                    Text("Services")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
                }
            }
            .padding(.top, 50)
            .padding(.bottom, 10)
            
            
            // MARK: - Search Cards
            
            VStack(spacing: 12) {
                
                // WHERE
                SearchCard(
                    isExpanded: selectedOption == .location,
                    label: "Where",
                    value: destination.isEmpty ? "Search destinations" : destination,
                    isPlaceholder: destination.isEmpty
                ) {
                    withAnimation(.spring()) {
                        selectedOption = .location
                    }
                } content: {
                    
                    VStack(spacing: 0) {
                        
                        // Search Field
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.systemGray2))
                            
                            TextField("Search destinations", text: $destination)
                        }
                        .padding(14)
                        .background(Color(.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.systemGray4))
                        )
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                        
                        // Suggestions
                        VStack(spacing: 0) {
                            ForEach(["Miami, Florida", "California", "Colorado", "New York"], id: \.self) { location in
                                Button {
                                    destination = location
                                    withAnimation(.spring()) {
                                        selectedOption = .dates
                                    }
                                } label: {
                                    HStack(spacing: 14) {
                                        Image(systemName: "clock.arrow.circlepath")
                                            .foregroundColor(Color(.systemGray2))
                                            .frame(width: 32, height: 32)
                                            .background(Color(.systemGray6))
                                            .clipShape(Circle())
                                        
                                        Text(location)
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                }
                            }
                        }
                    }
                }
                
                // WHEN
                SearchCard(
                    isExpanded: selectedOption == .dates,
                    label: "When",
                    value: "Any week",
                    isPlaceholder: true
                ) {
                    withAnimation(.spring()) {
                        selectedOption = .dates
                    }
                } content: {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .padding()
                        .tint(Color.red)
                }
                
                // WHO
                SearchCard(
                    isExpanded: selectedOption == .guests,
                    label: "Who",
                    value: guests == 1 ? "Add guests" : "\(guests) guests",
                    isPlaceholder: guests == 1
                ) {
                    withAnimation(.spring()) {
                        selectedOption = .guests
                    }
                } content: {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Adults")
                                .fontWeight(.semibold)
                            Text("Ages 13+")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 16) {
                            
                            Button {
                                if guests > 1 { guests -= 1 }
                            } label: {
                                Image(systemName: "minus")
                            }
                            
                            Text("\(guests)")
                            
                            Button {
                                guests += 1
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            // MARK: - Footer
            
            HStack {
                Button("Clear all") {
                    destination = ""
                    guests = 1
                    viewModel.searchText = ""
                }
                .underline()
                
                Spacer()
                
                Button {
                    viewModel.searchText = destination
                    show = false
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(Color.red)
                    .clipShape(Capsule())
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    DestinationSearchView(show: .constant(true), viewModel: ExploreViewModel())
}

// MARK: - SearchCard

struct SearchCard<Content: View>: View {
    
    let isExpanded: Bool
    let label: String
    let value: String
    let isPlaceholder: Bool
    let onTap: () -> Void
    let content: Content
    
    init(
        isExpanded: Bool,
        label: String,
        value: String,
        isPlaceholder: Bool,
        onTap: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.isExpanded = isExpanded
        self.label = label
        self.value = value
        self.isPlaceholder = isPlaceholder
        self.onTap = onTap
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Header
            Button(action: onTap) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(label)
                            .font(.system(size: 11, weight: .bold))
                            .textCase(.uppercase)
                        
                        if !isExpanded {
                            Text(value)
                                .font(.system(size: 14))
                                .foregroundColor(isPlaceholder ? .gray : .primary)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, isExpanded ? 16 : 18)
            }
            
            // Expanded Content
            if isExpanded {
                content
                    .padding(.bottom, 12)
            }
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(
            color: .black.opacity(isExpanded ? 0.1 : 0.05),
            radius: isExpanded ? 8 : 2
        )
    }
}
