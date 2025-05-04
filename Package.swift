// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftOpenNGC",
    platforms: [
        .iOS("15"),
        .macOS("12")
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftOpenNGC",
            targets: ["SwiftOpenNGC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/triple7/SwiftQValue", branch: "main"),
        .package(url: "https://github.com/dehesa/CodableCSV.git", from: "0.6.7")
    ],
    targets: [
        .target(
            name: "SwiftOpenNGC",
        dependencies: [
            "CodableCSV",
            .product(name: "SwiftQValue", package: "SwiftQValue"),
        ]),
            .testTarget(
            name: "SwiftOpenNGCTests",
            dependencies: ["SwiftOpenNGC"]
        ),
    ]
)
