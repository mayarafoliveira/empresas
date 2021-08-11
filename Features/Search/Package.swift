// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Search",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Search",
            targets: ["Search"]),
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../../Domain"
        )
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: ["Domain"])
    ]
)
