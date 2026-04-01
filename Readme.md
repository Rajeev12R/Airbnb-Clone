# 🏠 Airbnb-Clone (SwiftUI)

[![Swift Version](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017+-blue.svg)](https://developer.apple.com/ios/)
[![Architecture](https://img.shields.io/badge/Architecture-MVVM-green.svg)](#technical-architecture)


## 📸 Preview

> [!NOTE]
> Added the screenshots  below to showcase UI/UX skills.

| Explore Screen | Destination Search | Listing Details |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/2397b9cb-1e24-485c-8e35-c53081a515fc" width="250"> | <img src="https://github.com/user-attachments/assets/37b32ac9-8f8f-42a2-9fee-2db4b98f9fc8" width="250"> | <img src="https://github.com/user-attachments/assets/c692e97d-44a0-491e-9bbb-67690bb85cba" width="250"> |

| Profile Section |
| :---: |
| <img src="https://github.com/user-attachments/assets/58a415ea-08aa-43ac-86fb-e30da1534aa3" width="250"> | ![Wishlist](https://via.placeholder.com/200x400?text=Wishlist+Page) | ![Login](https://via.placeholder.com/200x400?text=Auth+Flow) |

---

## 🚀 Key Features

- **Dynamic Exploration**: Fluid, responsive "Explore" feed with category filtering (Trending, Islands, etc.).
- **Smart Search Flow**: Interactive destination search with date selection, guest count, and location search.
- **Detailed Listings**: Comprehensive listing views featuring high-quality image carousels, detailed amenities, and interactive maps.
- **Personalized Experience**: User profile management and real-time wishlists to save favorite properties.
- **Smooth Navigation**: Tab-based navigation with custom transitions and modern UI elements.

## 🛠 Technical Highlights

- **UI Framework**: Built entirely with **SwiftUI** for a modern, declarative interface.
- **Architecture**: Implements clean **MVVM (Model-View-ViewModel)** to ensure modularity, scalability, and testability.
- **Data Handling**: 
  - Reactive updates using `@Published`, `@StateObject`, and `@EnvironmentObject`.
  - Scalable data models with JSON-parsing compatibility.
- **Concurrency**: Leverages Swift's **Async/Await** and **MainActor** for performant, thread-safe network simulations and UI updates.
- **Modern Workflow**: Integrated **AI-assisted development tools** to accelerate UI building, optimize debugging, and maintain industry-leading code quality.

---

## 🧩 Project Structure

- `Core/`: Feature-based modules (Explore, Listings, Profile, Wishlist).
- `Components/`: Modular, reusable SwiftUI views (ImageCarousels, DetailRows, etc.).
- `ViewModels/`: Business logic and state management for every view.
- `Models/`: Strongly-typed data structs ensuring type safety.
- `Utils/`: Helper extensions and utility functions.

---

## 🏃 Getting Started

1. **Clone the project**:  
   ```bash
   git clone https://github.com/Rajeev12R/Airbnb-Clone.git
   ```
2. **Open in Xcode**:  
   Open `Airbnb.xcodeproj` using Xcode 15+.
3. **Run**:  
   Select a simulator (iPhone 15 Pro Recommended) and press `Cmd + R`.

---

## 👨‍💻 Developed By

**Rajeev Ranjan**  
*Aspiring iOS Engineer*  
[LinkedIn](https://www.linkedin.com/in/rajeev-ranjan-a81b2b21b/) | [GitHub](https://github.com/Rajeev12R)
