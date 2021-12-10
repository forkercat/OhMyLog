//
//  Log.swift
//
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
    public static func trace(_ message: String, showContext: Bool = true, file: String = #file, line: UInt = #line) {
        logger.trace(message, showContext: showContext, file: file, line: line)
    }
    
    @inline(__always)
    public static func debug(_ message: String, showContext: Bool = true, file: String = #file, line: UInt = #line) {
        logger.debug(message, showContext: showContext, file: file, line: line)
    }
    
    @inline(__always)
    public static func info(_ message: String, showContext: Bool = true, file: String = #file, line: UInt = #line) {
        logger.info(message, showContext: showContext, file: file, line: line)
    }
    
    @inline(__always)
    public static func error(_ message: String, showContext: Bool = true, file: String = #file, line: UInt = #line) {
        logger.error(message, showContext: showContext, file: file, line: line)
    }
    
    @inline(__always)
    public static func fatal(_ message: String, showContext: Bool = true, file: String = #file, line: UInt = #line) {
        logger.fatal(message, showContext: showContext, file: file, line: line)
    }
}
