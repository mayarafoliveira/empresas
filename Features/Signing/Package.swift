// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Signing",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Signing",
            targets: ["Signing"])
    ],
    dependencies: [
        .package(
            name: "Domain",
            path: "../../Domain"
        ),
        .package(
            name: "Common",
            path: "../../Common"
        )
    ],
    targets: [
        .target(
            name: "Signing",
            dependencies: [
                "Domain",
                "Common"
            ]
        )
    ]
)
