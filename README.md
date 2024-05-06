# StackCoordinator
StackCoordinator is a lightweight library that enables the use of the coordinator pattern in SwiftUI applications.

## Overview
The coordinator pattern is a design pattern commonly used in applications to handle navigation, dependency injection, and communication between different views and components. StackCoordinator provides a set of protocols and base classes that make it easy to implement the Coordinator pattern in your SwiftUI projects. This library was inspired by the ideas and concepts found in the [FlowCoordinators-SwiftUI-iOS16 repository](https://github.com/michzio/FlowCoordinators-SwiftUI-iOS16), which has been a valuable resource in the development of StackCoordinator.

## Installation
You can install StackCoordinator using Swift Package Manager. Add the following line to your project's Package.swift file:


```swift
.package(url: "https://github.com/dodo849/StackCoordinator.git", .upToNextMajor(from: "1.0.0")),
```
Then, add the following to the dependencies section of your project:

```swift
.product(name: "StackCoordinator", package: "StackCoordinator"),
```

Now, StackCoordinator is ready to be used.


## How to use

1. Wrap the ContentView with RootBuilder at the top level.
```swift
@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootBuilder { path in
                ContentView(path: path)
            }
        }
    }
}
```


2. Create an enum that inherits from `LinkProtocol`. This enum represents which pages can be navigated to from the current page. Define identifiers for views using case statements, and create the corresponding views in the matchView function.

```swift
enum SampleLink: LinkProtocol {
    
    case firstView
    case secondView
    
    func matchView() -> any View {
        switch self {
        case .firstView:
            return FirstView() // Use FirstViewBuilder() if the destination view also has a builder.
        case .secondView:
            return SecondView()
        }
    }
}
```

3. Implement a view using `BuilderProtocol`. Use BaseCoordinator to create a coordinator using Link, and pass it to BaseBuilder. Then, pass the coordinator to the object requiring screen navigation (either View or ViewModel).

```swift
struct SampleBuilder: BuilderProtocol {
    
    var coordinator = BaseCoordinator<SampleLink>()
    
    var body: some View {
        BaseBuilder(coordinator: coordinator) {
            SampleView(viewModel: SampleViewModel(coordinator: coordinator))
        }
    }
}
```

4. Move to the view defined in the Link by appending the enum to the path from View or ViewModel.

```swift
var coordinator: BaseCoordinator<SampleLink>

self.coordinator.push(
      SampleLink.firstView
)
// or
coordinator.sheet = SampleLink.secondView
```

You can perform all these steps for the views where you want to perform screen transitions.

## Caution
This package is only available for iOS 16.0+ because it uses [NavigationStack](https://developer.apple.com/documentation/swiftui/navigationstack) for screen transitions.

## Requirements
- iOS 16.0+
- Swift 5.0+

## Contribution
Contributions to StackCoordinator are welcome! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request.

## License
StackCoordinator is available under the MIT license. See the [LICENSE](https://github.com/dodo849/StackCoordinator/blob/main/LICENSE) file for more info.
