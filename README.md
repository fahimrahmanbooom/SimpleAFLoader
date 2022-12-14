# SimpleAFLoader

A lightweight loading animation that can be applied to any SwiftUI view with 1 line of code. All animations are built using the SwiftUI framework.

:thumbsup: **Animation Speed Control!**

:art: **Works with any Color**

:toolbox: **Customize Loading text, speed & size**

:white_check_mark: **No keyframe animations or DispatchQueue calls** that could negatively affect the UI

:white_check_mark: **Source files have no depencendies** and can be extracted without issue

![](https://media.giphy.com/media/XJY2e7MSOm8pU51Gba/giphy.gif)

## Installation

**Swift Package Manager** 

The Swift Package Manager is a tool for managing the distribution of Swift code. To use SimpleAFLoader with Swift Package Manager in an Xcode project:

* File -> Swift Packages -> Add Package Dependency ->
* Add URL for this repository: https://github.com/fahimrahmanbooom/SimpleAFLoader.git

## Usage

Firstly, import the package to your file.

```swift
import SimpleAFLoader
```

After that create a @State variable.

```swift
@State private var isLoaderVisible: Bool = false
```

1. Then must add an .overlay() modifier to your main SwiftUI Stack view. It can be ZStack, VStack or HStack.
2. To Show/Hide the view you just have to toggle the value for "showLoader" bool parameter.
3. Use .disabled() modifier to disable the user interaction while loading. (Optional)
Note that if you have multiple overlay then place the LoaderView overlay at the last position.

```swift
ZStack {
    //...
}
.overlay(**Put The Loader View Here**)
.disabled(isLoaderVisible)
```

Complete Representation:

```swift
import SwiftUI

struct ContentView: View {
    
    @State private var isLoaderVisible: Bool = false
    
    var body: some View {
        ZStack {
            //...
        }
        .overlay(LoaderView(loaderColor: .red, loaderTextColor: .red, loadingText: "Loading", loaderElementSize: .medium, loaderAnimationSpeed: .medium, showLoader: isLoaderVisible))
        .disabled(isLoaderVisible)
        .onAppear {
            isLoaderVisible.toggle()
        }
    }
}
```

The indicators are customizable in terms of text, color, size, and speed. All parameters are optional and will init with default values if not included. Example implementations:

```swift
// DEFAULT PARAMETERS:

// Text == nil          (Options: "Any Single Line Text")
// Color == .secondary  (Options: Any Color)
// Size == .medium      (Options: .small, .medium, .large)
// Speed == .medium     (Options: .low, .medium, .high)

// Use 1:
.overlay(LoaderView(showLoader: isLoaderVisible))
        
// Use 2:
.overlay(LoaderView(loadingText: "Loading", showLoader: isLoaderVisible))
        
// Use 3:
.overlay(LoaderView(loaderColor: .red, loaderTextColor: .red, loadingText: "Loading", showLoader: isLoaderVisible))
        
// Use 4:
.overlay(LoaderView(loaderColor: .green, loaderTextColor: .green, loadingText: "Loading", loaderElementSize: .medium, showLoader: isLoaderVisible))
        
// Use 5:
.overlay(LoaderView(loaderColor: .orange, loaderTextColor: .orange, loadingText: "Loading", loaderElementSize: .large, loaderAnimationSpeed: .high, showLoader: isLoaderVisible))
```

**Supported Platforms:**
* .iOS(.v14) and +


**Please Leave a star if you like SimpleAFLoader**
