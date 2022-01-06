//
//  Log+Any.swift
//  OhMyLog
//
//  Created by Junhao Wang on 1/5/22.
//

import Foundation

extension Log {
    @inline(__always)
    public static func trace(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.trace(object, file, line)
    }
    
    @inline(__always)
    public static func debug(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.debug(object, file, line)
    }
    
    @inline(__always)
    public static func warn(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.warn(object, file, line)
    }
    
    @inline(__always)
    public static func info(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.info(object, file, line)
    }
    
    @inline(__always)
    public static func error(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.error(object, file, line)
    }
    
    @inline(__always)
    public static func fatal(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        logger.fatal(object, file, line)
    }
}
