// swift-tools-version:5.7.1

// Copyright 2017 Tony Allevato.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "icu-swift",
  products: [
    .library(name: "ICU", type: .static, targets: ["ICU"]),
  ],
  dependencies: [
    .package(url: "https://github.com/izackp/icu4c-swift", branch:"master")
  ],
  targets: [
    .target(name: "ICU", dependencies: [
      Target.Dependency.product(name: "ICU4CMac", package: "icu4c-swift", condition: .when(platforms: [.iOS, .macOS, .watchOS, .tvOS])),
      Target.Dependency.product(name: "ICU4C", package: "icu4c-swift", condition: .when(platforms: [.android, .driverKit, .wasi, .windows]))
      ]),
    .testTarget(name: "ICUTests", dependencies: ["ICU"]),
  ]
)
