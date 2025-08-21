# Thamanyah - iOS

**Thamanyah** is a streaming app built with SwiftUI. It displays a home screen with featured and categorized movies and shows. The app supports searching across the content library, switching between English and Arabic languages, and adapting to system themes with full dark mode and light mode support.

## 🚀 Features

- Home screen displaying multiple dynamic sections of different views (movies, series, podcasts, etc.) with **pagination** support
- Separate **Search screen** to quickly find content
- Support for English and Arabic languages with automatic RTL/LTR adjustment
- Dark mode and light mode support with custom theme colors
- Smooth animation

---

## 📱 Screens

- [x] Splash Screen
- [x] Home Screen
- [x] Search Screen 
- [x] Profile Screen 

---

## 🛠 Technologies Used

### ✅ SwiftUI

- Declarative UI with smooth layout and rendering

### ✅ MVVM + Clean Architecture

- **Presentation Layer**: SwiftUI views and ViewModels  
- **Domain Layer**: Entities and Use Cases  
- **Data Layer**: Networking, Services, Repositories and Data Mapping

### ✅ Networking

- REST API integration using **Alamofire**

### ✅ Async/Await

- Modern concurrency with async/await used for asynchronous tasks and networking

### ✅ Local Storage

- SwiftUI's @AppStorage used for persisting small user preferences and settings locally within the app

### ✅ Dependency Injection

- **Use Cases**, **Repositories**, and **Service Layers** are injected into **ViewModels** to promote modularity, testability, and clean architecture

### ✅ SDWebImage for Image Loading

- Efficiently loads and caches images from URLs

### ✅ Unit Testing

- Used **XCTest** framework to test **HomeViewModel** and **SearchViewModel**
- Created **mock services, repositories, and use cases** to provide fake data for testing

### ✅ Package Management

- Dependencies managed using Swift Package Manager (SPM)

---

## 📋 Requirements

- iOS 18.0+
- Xcode 15.0+
- Swift 5+

---

## ✅ Installation

- Clone the repository
- Open `Thmanyah-Task.xcodeproj` in Xcode
- Build and run the app on simulator or device
