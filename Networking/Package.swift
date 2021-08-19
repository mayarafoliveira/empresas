// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"])
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../Domain"
        )
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: ["Domain"])
    ]
)
