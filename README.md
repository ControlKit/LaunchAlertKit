# LaunchAlertKit

A powerful iOS Swift Package for displaying launch alerts with server-side configuration, multiple UI styles, and multilingual support. LaunchAlertKit allows you to show customizable alerts when your app launches, with options to dismiss or navigate to external links.

## 📋 Technical Specifications

- **Language**: Swift 5.9+
- **Minimum iOS Version**: iOS 13.0+
- **Minimum Xcode Version**: Xcode 14.0+
- **Package Manager**: Swift Package Manager, CocoaPods
- **License**: MIT License
- **Repository**: [https://github.com/ControlKit/LaunchAlertKit](https://github.com/ControlKit/LaunchAlertKit)
- **Android Version**: [https://github.com/ControlKit/LaunchAlertKit-android](https://github.com/ControlKit/LaunchAlertKit-android)

## 🚀 Features

- **Server-Side Configuration**: Alerts are configured remotely and fetched when the app launches
- **Multiple UI Styles**: 6 different alert styles (1 fullscreen + 5 popover variants)
- **Multilingual Support**: Built-in support for multiple languages with `LocalString` structure
- **Smart Display Logic**: Only shows alerts that haven't been seen before (based on server ID)
- **Customizable Appearance**: Full control over colors, fonts, images, and layout
- **Action Tracking**: Tracks user interactions (view, accept, cancel) for analytics
- **Easy Integration**: Simple 2-line implementation for basic usage
- **iOS 13+ Support**: Compatible with modern iOS versions

## 📱 Alert Styles

LaunchAlertKit provides 6 different alert styles:

1. **Fullscreen1**: Full-screen overlay with large icon and centered content
2. **Popover1**: Card-style popup with gear icon and light background
3. **Popover2**: Similar to Popover1 with different styling
4. **Popover3**: Alternative popover design
5. **Popover4**: Another popover variant
6. **Popover5**: Final popover style option

## 🛠 Installation

### Swift Package Manager

Add LaunchAlertKit to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/ControlKit/LaunchAlertKit.git", from: "1.0.0")
]
```

### CocoaPods

```ruby
pod 'LaunchAlertKit'
```

## 📖 Usage

### Simple Implementation (2 Lines of Code)

The simplest way to implement LaunchAlertKit requires just 2 lines of code:

```swift
import LaunchAlertKit

// In your AppDelegate or SceneDelegate
let launchAlert = LaunchAlertKit()
let config = AlertServiceConfig(appId: "your-app-id", language: .english)
await launchAlert.configure(root: window.rootViewController!, config: config)
```

### Advanced Implementation

For more control over the alert configuration:

```swift
import LaunchAlertKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configure launch alert
        Task {
            await configureLaunchAlert()
        }
        
        return true
    }
    
    @MainActor
    private func configureLaunchAlert() async {
        let launchAlert = LaunchAlertKit()
        
        // Create configuration with custom style
        let config = AlertServiceConfig(
            style: .popover1,  // Choose from .fullscreen1, .popover1-5
            appId: "your-unique-app-id",
            language: .english  // Supports multiple languages
        )
        
        // Present the alert
        await launchAlert.configure(
            root: window.rootViewController!,
            modalPresentationStyle: .fullScreen,  // Optional: customize presentation
            config: config
        )
    }
}
```

### Custom Configuration

You can customize the alert appearance by modifying the view configuration:

```swift
let config = AlertServiceConfig(
    style: .fullscreen1,
    appId: "your-app-id",
    language: .english
)

// Customize the view configuration
config.viewConfig.titleColor = .systemBlue
config.viewConfig.descriptionTextColor = .systemGray
config.viewConfig.buttonBackColor = .systemGreen
config.viewConfig.imageType = .alertIcon1  // Choose from alertIcon1-5, gear
config.viewConfig.popupViewCornerRadius = 20.0
```

## 🌍 Multilingual Support

LaunchAlertKit supports multiple languages through the `CKLanguage` enum and `LocalString` structure:

```swift
// Supported languages
let config = AlertServiceConfig(
    appId: "your-app-id",
    language: .english  // .french, .spanish, .german, etc.
)
```

The server response includes localized strings:

```swift
public struct AlertModel: Codable {
    public let title: LocalString?           // Localized title
    public let description: LocalString?     // Localized description
    public let button_title: LocalString?    // Localized button text
    public let cancel_button_title: LocalString? // Localized cancel button text
}
```

## 🎨 Customization Options

### View Configuration Properties

```swift
// Colors
config.viewConfig.contentViewBackColor = UIColor.black.withAlphaComponent(0.8)
config.viewConfig.popupViewBackColor = .white
config.viewConfig.titleColor = .black
config.viewConfig.descriptionTextColor = .gray
config.viewConfig.buttonBackColor = .systemBlue
config.viewConfig.buttonTitleColor = .white

// Fonts
config.viewConfig.titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
config.viewConfig.descriptionFont = UIFont.systemFont(ofSize: 16, weight: .medium)
config.viewConfig.buttonFont = UIFont.systemFont(ofSize: 18, weight: .semibold)

// Layout
config.viewConfig.popupViewCornerRadius = 15.0
config.viewConfig.buttonCornerRadius = 25.0
config.viewConfig.contentViewAlpha = 1.0

// Images
config.viewConfig.imageType = .alertIcon1  // Built-in icons
config.viewConfig.image = "custom-image"   // Custom image name
config.viewConfig.imageColor = .systemBlue // Tint color for images
```

### Image Types

LaunchAlertKit includes built-in image assets:

- `alertIcon1` - Alert icon variant 1
- `alertIcon2` - Alert icon variant 2  
- `alertIcon3` - Alert icon variant 3
- `alertIcon4` - Alert icon variant 4
- `alertIcon5` - Alert icon variant 5
- `gear` - Settings/gear icon

## 🔧 Server Integration

### Alert Request Structure

The kit automatically sends requests to your server with the following structure:

```swift
public struct AlertRequest: GenericRequest {
    public var appId: String
    public var route: ControlKitItem = .launch_alert
    public var httpMethod: HTTPMethod = .get
    public var applicationVersion: String
    public var deviceUUID: String
    public var sdkVersion: String = "1.0.0"
}
```

### Expected Server Response

Your server should return an `AlertResponse` with the following structure:

```swift
public struct AlertResponse: Codable {
    public var data: AlertModel?
}

public struct AlertModel: Codable {
    public let id: String                    // Unique alert ID
    public let title: LocalString?          // Localized title
    public let description: LocalString?     // Localized description
    public let icon: String?                // Icon URL or name
    public let link: String?                // Action URL
    public let button_title: LocalString?   // Localized button text
    public let cancel_button_title: LocalString? // Localized cancel text
    public let sdk_version: String?         // Required SDK version
    public let minimum_version: String?     // Minimum app version
    public let maximum_version: String?     // Maximum app version
    public let created_at: String?          // Creation timestamp
}
```

### Action Tracking

The kit automatically tracks user interactions:

```swift
public enum ControlKitAction {
    case view      // Alert was displayed
    case accepted  // User tapped the action button
    case canceled  // User dismissed the alert
}
```

## 🏗 Architecture

LaunchAlertKit follows a clean architecture pattern:

- **Protocols**: `Alertable`, `AlertActionable` define the contract
- **Services**: Handle network requests and responses
- **ViewModels**: Manage business logic and state
- **Views**: Present the UI with multiple style options
- **Configuration**: Centralized configuration management

### Key Components

1. **LaunchAlertKit**: Main entry point and coordinator
2. **AlertServiceConfig**: Configuration for service and view
3. **LaunchAlertViewModel**: Handles business logic and actions
4. **LaunchAlertViewController**: Manages the alert presentation
5. **LaunchAlertViewStyle**: Factory for different UI styles

## 🔗 Dependencies

- ControlKitBase: Core networking and utilities

## 📋 Requirements

- iOS 13.0+
- Swift 5.9+
- Xcode 14.0+

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you encounter any issues or have questions, please open an issue on GitHub.

---

**Made with ❤️ for iOS developers**