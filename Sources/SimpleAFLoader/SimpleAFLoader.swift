//
//  LoaderView.swift
//  SimpleAFLoader
//
//  Created by Fahim Rahman on 13/8/22.
//  https://github.com/fahimrahmanbooom
//

import SwiftUI

// loader element size selection
public enum LoaderElementSize {
    case small, medium, large

    // loader size
    var loaderSize: CGFloat {
        switch self {
            case .small: return 25
            case .medium: return 35
            case .large: return 50
        }
    }

    // loader text size
    var loaderTextSize: CGFloat {
        switch self {
            case .small: return 12
            case .medium: return 15
            case .large: return 18
        }
    }
}


// loader animation
public enum LoaderAnimation {
    case low, medium, high

    // loader animation speed
    var animationSpeed: Double {
        switch self {
            case .low: return 1.0
            case .medium: return 0.8
            case .high: return 0.5
        }
    }
}


public struct LoaderView: View {

    var loaderColor: Color?
    var loaderTextColor: Color?
    var loadingText: String?
    var loaderElementSize: LoaderElementSize? = .medium
    var loaderAnimationSpeed: LoaderAnimation? = .medium
    var showLoader: Bool = false

    public var body: some View {
        GeometryReader { reader in
            VStack {
                // loader
                Circle()
                    .trim(from: 0.2, to: 1)
                    .stroke(loaderColor ?? .secondary, lineWidth: 3.9)
                    .frame(width: loaderElementSize?.loaderSize, height: loaderElementSize?.loaderSize, alignment: .leading)
                    .rotationEffect(.degrees(showLoader ? 360 : 0))
                    .animation(Animation.easeInOut(duration: showLoader ? loaderAnimationSpeed?.animationSpeed ?? 0.8 : 0).repeatForever(autoreverses: false), value: showLoader)
                    .padding((loadingText != "") ? 5 : 0)
                // loading text
                Text(loadingText ?? "")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(loaderTextColor ?? .secondary)
                    .font(.system(size: loaderElementSize?.loaderTextSize ?? 15, design: .rounded))
                    .padding((loadingText != "") ? 5 : 0)
                    .opacity((loadingText != "") ? 1 : 0)
            } //: vstack
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .opacity(showLoader ? 1 : 0)
            .background(Color.clear)
            .position(x: reader.size.width / 2, y: reader.size.height / 2)
        } //: GeoReader
    } //: view
    
    // initializer
    public init(loaderColor: Color? = .secondary, loaderTextColor: Color? = .secondary, loadingText: String? = "", loaderElementSize: LoaderElementSize? = .medium, loaderAnimationSpeed: LoaderAnimation? = .medium, showLoader: Bool) {
        self.loadingText = loadingText
        self.loaderColor = loaderColor
        self.loaderTextColor = loaderTextColor
        self.loaderElementSize = loaderElementSize
        self.loaderAnimationSpeed = loaderAnimationSpeed
        self.showLoader = showLoader
    }
} //: Loader view
