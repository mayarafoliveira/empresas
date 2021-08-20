// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Common",
            targets: ["Common"])
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../Domain"
        )
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: ["Domain"])
    ]
)
