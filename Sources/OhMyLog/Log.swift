//
//  Log.swift
//  OhMyLog
//
//  Created by Junhao Wang on 12/9/21.
//

import Foundation

public enum Log {
    static var logger = Logger(name: Logger.Defaults.loggerName, level: Logger.Defaults.logLevel)
    
    @inline(__always)
    public static func registerLogger(name: String, level: Logger.Level = Logger.Defaults.logLevel) {
        logger = Logger(name: name, level: level)
    }
    
    @inline(__always)
    public static func setLevel(level: Logger.Level) {
        logger.logLevel = level
    }
    
    @inline(__always)
    public static func showLevelIcon(enabled: Bool) {
        logger.showLevelIcon = enabled
    }

    @inline(__always)
    public static func showContext(enabled: Bool) {
        logger.showContext = enabled
    }
}
