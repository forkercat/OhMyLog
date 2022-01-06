# OhMyLog

[![macOS](https://github.com/forkercat/OhMyLog/actions/workflows/ci-macos.yml/badge.svg)](https://github.com/forkercat/OhMyLog/actions/workflows/ci-macos.yml)
[![Linux](https://github.com/forkercat/OhMyLog/actions/workflows/ci-linux.yml/badge.svg)](https://github.com/forkercat/OhMyLog/actions/workflows/ci-linux.yml)
[![Windows](https://github.com/forkercat/OhMyLog/actions/workflows/ci-windows.yml/badge.svg)](https://github.com/forkercat/OhMyLog/actions/workflows/ci-windows.yml)
[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)

[![platform-compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fforkercat%2FOhMyLog%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/forkercat/OhMyLog)
[![swift-version-compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fforkercat%2FOhMyLog%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/forkercat/OhMyLog)

OhMyLog is a simple logging package for Swift. It supports the following features:

- Six logging levels: TRACE 🟤, DEBUG 🟢, INFO ⚪️, WARN 🟡, ERROR 🔴, FATAL 🚨
- Display log context including filename and line number
- Show time
- Output string or any object directly similar to `print()`
- Toogle display of level icons and context information

## 🔧 Install

You package file would be like:

```swift
let package = Package(
    name: "YourPackageName",
    
    dependencies: [
        .package(url: "https://github.com/forkercat/OhMyLog.git", .branch("main")),
    ],
    
    targets: [
        // For Swift 5.5, use .executableTarget
        .target(
            name: "YourPackageName",
            dependencies: [
                .product(name: "OhMyLog", package: "OhMyLog")
            ]),
    ]
)
```

## 😆 Usage

### Option 1️⃣: Use Logger object

```swift
import OhMyLog

var logger = Logger(name: "Example-1", level: .info)
logger.logLevel = .trace
logger.showLevelIcon = true

let list = ["Oh", "My", "Log"]

logger.trace("Hello, World! \(list)")
logger.debug("Hello, World! \(list)")
logger.info("Hello, World! \(list)")
logger.warn("Hello, World! \(list)")
logger.error("Hello, World! \(list)")
logger.fatal("Hello, World! \(list)")

// Output
🟤 [06:52:31.672] TRACE Example-1: Hello, World! ["Oh", "My", "Log"]
🟢 [06:52:31.672] DEBUG Example-1: Hello, World! ["Oh", "My", "Log"]
⚪️ [06:52:31.673] INFO Example-1: Hello, World! ["Oh", "My", "Log"]
🟡 [06:52:31.673] WARN Example-1: Hello, World! ["Oh", "My", "Log"]
🔴 [06:52:31.673] ERROR Example-1: Hello, World! ["Oh", "My", "Log"]
🚨 [06:52:31.673] FATAL Example-1: Hello, World! ["Oh", "My", "Log"]
```

### Option 2️⃣: Use Log namespace

```swift
import OhMyLog

Log.registerLogger(name: "Example-2", level: .info)
Log.setLevel(level: .info)
Log.info("Hello, World! \(list)")
Log.logLevel = .trace
Log.showLevelIcon(enabled: false)

let list = ["Oh", "My", "Log"]
Log.info("\(list)")
Log.warn(list)

// Output
[INFO] [06:52:31.673] Example-2 main.swift:26 - Hello, World! ["Oh", "My", "Log"]
[WARN] [06:52:31.674] Example-2 main.swift:26 - Hello, World! ["Oh", "My", "Log"]
```

### Option 3️⃣: Without import

Create a swift source file in your project with two lines.

```swift
import OhMyLog

typealias Log = OhMyLog.Log
```

Now you are able to log without `import OhMyLog`.

```swift
Log.registerLogger(name: "Example-3", level: .info)
Log.setLevel(level: .info)

let six = 666

Log.trace(030)
Log.info(six)

// Output
🟤 [06:52:31.673] TRACE Example-3: 30
⚪️ [06:52:31.673] INFO Example-3: 666
```

## 🙏 Reference

- [How To Do Logging In Swift The Right Way | How To Create A Custom Logging Utility](https://www.youtube.com/watch?v=Ao6jkaV_9Kc&ab_channel=AryamanSharda)
