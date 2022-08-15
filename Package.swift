// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleAFLoader",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SimpleAFLoader",
            targets: ["SimpleAFLoader"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SimpleAFLoader",
            dependencies: []),
        .testTarget(
            name: "SimpleAFLoaderTests",
            dependencies: ["SimpleAFLoader"]),
    ]
)
