// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AparokshaStarter",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "AparokshaStarter",
            targets: ["AparokshaStarter"]
        )
    ],
    dependencies: [
        .package(url: "https://git.aparoksha.dev/aparoksha/aparoksha", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "AparokshaStarter",
            dependencies: [
                .product(name: "Aparoksha", package: "aparoksha")
            ],
            path: "Sources/AparokshaStarter"
        )
    ],
    swiftLanguageModes: [.v5]
)
