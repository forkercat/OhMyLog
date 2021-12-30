//
//  Logger+String.swift
//  OhMyLog
//
//  Created by Junhao Wang on 12/29/21.
//

import Foundation

extension Logger {
    @inline(__always)
    public func trace(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .trace, message: message, file, line)
    }
    
    @inline(__always)
    public func debug(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .debug, message: message, file, line)
    }
    
    @inline(__always)
    public func info(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .info, message: message, file, line)
    }
    
    @inline(__always)
    public func warn(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .warn, message: message, file, line)
    }
    
    @inline(__always)
    public func error(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .error, message: message, file, line)
    }
    
    @inline(__always)
    public func fatal(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        handleLog(level: .fatal, message: message, file, line)
    }
    
    func handleLog(level: Level, message: String, _ file: String, _ line: UInt) {
#if DEBUG
        // Current log level is lower than the one specified in config. Skip logging.
        if level.rawValue < logLevel.rawValue {
            return
        }
        
        let timeStr = dateFormatter.string(from: Date())
        let levelComponent = "\(level.toString)"
        
        var components: [String] = [timeStr, levelComponent]
        
        if showContext {
            components.append("\(name).\(Context(file: file, line: line).description)")
        } else {
            components.append("\(name)")
        }
        
        if showLevelIcon {
            components.insert(level.toIcon, at: 0)
        }
        
        let prefix = components.joined(separator: " ")
        print("\(prefix): \(message)")
#endif
    }
}
