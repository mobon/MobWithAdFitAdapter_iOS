// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MobWithAdFitAdapter",
    platforms: [
        .iOS("15.6")
    ],
    products: [
       .library(
           name: "MobWithAdFitAdapter",
           targets: ["MobWithAdFitAdapterTarget"]
       )
   ],
    dependencies: [
        .package(url: "https://github.com/mobon/MobWithAdSDK_SPM.git", .upToNextMinor(from: "1.3.39")),
        .package(url: "https://github.com/adfit/adfit-spm.git", .upToNextMinor(from: "3.21.24"))
    ],
    targets: [
        .binaryTarget(
            name: "MobWithAdFitAdapter",
            url: "https://github.com/mobon/MobWithAdFitAdapter_iOS/releases/download/1.0.0/MobWithAdFitAdapter.xcframework.zip",
            checksum: "897f231daaf760e37a6e3a9d86e9bbced98783eb36b0a756f7375bef15989b5e"
        ),
        .target(
            name: "MobWithAdFitAdapterTarget",
            dependencies: [
                .target(name: "MobWithAdFitAdapter"),
                .product(name: "MobWithADSDK", package: "MobWithAdSDK_SPM"),
                .product(name: "AdFitSDK", package: "adfit-spm")
            ],
            path: "Sources/MobWithAdFitAdapterTarget"
        )
    ]
)