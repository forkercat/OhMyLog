//
//  main.swift
//  OhMyLog-Demo
//
//  Created by Junhao Wang on 12/29/21.
//

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

print("\nWhy am I still using print()???\n")

logger.showLevelIcon = true
logger.showContext = false

logger.trace("Hello, World! \(list)")
logger.debug("Hello, World! \(list)")
logger.info("Hello, World! \(list)")
logger.warn("Hello, World! \(list)")
logger.error("Hello, World! \(list)")
logger.fatal("Hello, World! \(list)")

print("\nTry printing objects...\n")

class Cat { }

let cat = Cat()
let six: Int? = 666
let nilInt: Int? = nil

logger.trace(030)
logger.info(cat)
logger.warn(six ?? 0)
logger.error(nilInt ?? "nil")

print("")
