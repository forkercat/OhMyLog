//
//  Log+String.swift
//  OhMyLog
//
//  Created by Junhao Wang on 1/5/22.
//

import Foundation

extension Log {
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
