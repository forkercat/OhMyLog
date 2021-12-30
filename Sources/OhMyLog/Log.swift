//
//  Log.swift
//  OhMyLog
//
//  Created by Junhao Wang on 12/9/21.
//

import Foundation

public enum Log {
    private static var logger = Logger(name: Logger.Defaults.loggerName, level: Logger.Defaults.logLevel)
    
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
    
    @inline(__always)
    public static func trace(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.trace(message, file, line)
    }
    
    @inline(__always)
    public static func debug(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.debug(message, file, line)
    }
    
    @inline(__always)
    public static func warn(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.warn(message, file, line)
    }
    
    @inline(__always)
    public static func info(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.info(message, file, line)
    }
    
    @inline(__always)
    public static func error(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.error(message, file, line)
    }
    
    @inline(__always)
    public static func fatal(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        logger.fatal(message, file, line)
    }
}
