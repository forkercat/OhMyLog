// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OhMyLog",
    
    products: [
        .library(
            name: "OhMyLog",
            targets: ["OhMyLog"]),
    ],
    
    dependencies: [
        
    ],
    
    targets: [
        .target(
            name: "OhMyLog",
            dependencies: []),
        
        .executableTarget(
            name: "OhMyLog-Demo",
            dependencies: [
                "OhMyLog"
            ])
    ]
)
