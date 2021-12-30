//
//  Logger+Any.swift
//  
//
//  Created by Junhao Wang on 12/29/21.
//

import Foundation

extension Logger {
    @inline(__always)
    public func trace(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .trace, object: object, file, line)
    }
    
    @inline(__always)
    public func debug(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .debug, object: object, file, line)
    }
    
    @inline(__always)
    public func info(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .info, object: object, file, line)
    }
    
    @inline(__always)
    public func warn(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .warn, object: object, file, line)
    }
    
    @inline(__always)
    public func error(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .error, object: object, file, line)
    }
    
    @inline(__always)
    public func fatal(_ object: Any, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .fatal, object: object, file, line)
    }
    
    func handleLog(level: Level, object: Any, _ file: String, _ line: UInt) {
#if DEBUG
        handleLog(level: level, message: "\(object)", file, line)
#endif
    }
}

