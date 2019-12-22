// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ARServer",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura", from: "2.9.1"),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.9.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", from: "0.6.1"),
        .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", from: "2.0.2"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "ARServer",
            dependencies: [ .target(name: "Application") ]
        ),
        .target(
            name: "Application",
            dependencies: [ "Kitura", "HeliumLogger", "SwiftKueryORM", "SwiftKueryMySQL", "KituraOpenAPI" ]
        ),
        .testTarget(
            name: "ApplicationTests",
            dependencies: [ .target(name: "Application") ]
        ),
    ]
)
