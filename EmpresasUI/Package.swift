// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmpresasUI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "EmpresasUI",
            targets: ["EmpresasUI"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "EmpresasUI",
            dependencies: [])
    ]
)
