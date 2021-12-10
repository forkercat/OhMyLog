# OhMyLog

OhMyLog is a simple logging package for Swift. It supports the following feature:

- Six logging levels (👣, 🔍, 💡, ⚠️, 🚨, 💊)
- Display log context including filename and line number

## Install

You package file would be like:

```swift
let package = Package(
    name: "YourPackageName",
    
    dependencies: [
        .package(url: "https://github.com/forkercat/OhMyLog.git", .branch("main")),
    ],
    
    targets: [
        .executableTarget(
            name: "YourPackageName",
            dependencies: [
                .product(name: "OhMyLog", package: "OhMyLog")
            ]),
    ]
)
```

## Usage

### Option 1: Use Logger object

```swift
import OhMyLog

let list = ["Oh", "My", "Log"]

var logger = Logger(name: "MyProject", level: .info)
logger.logLevel = .trace
logger.trace("Hello, World! \(list)")
logger.debug("Hello, World! \(list)")
logger.info("Hello, World! \(list)")
logger.warn("Hello, World! \(list)")
logger.error("Hello, World! \(list)")
logger.fatal("Hello, World! \(list)")

// Output
[👣TRACE] MyProject main.swift:24 - Hello, World! ["Oh", "My", "Log"]
[🔍DEBUG] MyProject main.swift:25 - Hello, World! ["Oh", "My", "Log"]
[💡INFO ] MyProject main.swift:26 - Hello, World! ["Oh", "My", "Log"]
[⚠️WARN ] MyProject main.swift:27 - Hello, World! ["Oh", "My", "Log"]
[🚨ERROR] MyProject main.swift:28 - Hello, World! ["Oh", "My", "Log"]
[💊FATAL] MyProject main.swift:29 - Hello, World! ["Oh", "My", "Log"]
```

### Option 2: Use Log namespace

```swift
import OhMyLog

let list = ["Oh", "My", "Log"]

Log.registerLogger(name: "MyProject", level: .info)
Log.setLevel(level: .info)
Log.info("Hello, World! \(list)")

// Output
[💡INFO ] MyProject main.swift:26 - Hello, World! ["Oh", "My", "Log"]
```

### Option 3: Without import (recommended)

Create a swift source file in your project with two lines.

```swift
import OhMyLog

typealias Log = OhMyLog.Log
```

Now you are able to log without `import OhMyLog`.

```swift
let list = ["Oh", "My", "Log"]

Log.registerLogger(name: "MyProject", level: .info)
Log.setLevel(level: .info)
Log.info("Hello, World! \(list)")

// Output
[💡INFO ] MyProject main.swift:26 - Hello, World! ["Oh", "My", "Log"]
```

## Reference

- [How To Do Logging In Swift The Right Way | How To Create A Custom Logging Utility](https://www.youtube.com/watch?v=Ao6jkaV_9Kc&ab_channel=AryamanSharda)
