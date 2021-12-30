// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "OhMyLog",
    
    products: [
        .library(
            name: "OhMyLog",
            targets: ["OhMyLog"]),
    ],
    
    dependencies: [],
    
    targets: [
        .target(
            name: "OhMyLog",
            dependencies: []),
        
        .target(
            name: "OhMyLog-Demo",
            dependencies: [
                "OhMyLog"
            ])
    ]
)
