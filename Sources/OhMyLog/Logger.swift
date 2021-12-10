//
//  Logger.swift
//
//
//  Created by Junhao Wang on 12/9/21.
//

import Foundation

public class Logger {
    public enum Level: Int {
        case trace
        case debug
        case info
        case warn
        case error
        case fatal
        
        fileprivate var toString: String {
            switch self {
            case .trace:  return "TRACE"
            case .debug:  return "DEBUG"
            case .info:   return "INFO "
            case .warn:   return "WARN "
            case .error:  return "ERROR"
            case .fatal:  return "FATAL"
            }
        }
        
        fileprivate var toIcon: String {
            switch self {
            case .trace:  return "👣"
            case .debug:  return "🔍"
            case .info:   return "💡"
            case .warn:   return "⚠️"
            case .error:  return "🚨"
            case .fatal:  return "💊"
            }
        }
    }
    
    fileprivate struct Context {
        let file: String
        let line: Int
        
        var description: String {
            return "\((file as NSString).lastPathComponent):\(line)"
        }
    }
    
    public let name: String
    public var minLevel: Level = .info
    
    public init(name: String = "Default", level: Level = .info) {
        self.name = name.isEmpty ? "Default" : name
        self.minLevel = level
    }
    
    @inline(__always)
    public func trace(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .trace, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    @inline(__always)
    public func debug(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .debug, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    @inline(__always)
    public func info(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .info, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    @inline(__always)
    public func warn(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .warn, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    @inline(__always)
    public func error(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .error, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    @inline(__always)
    public func fatal(_ message: String, showContext: Bool = true, file: String = #file, line: Int = #line) {
        handleLog(level: .fatal, message: message, context: showContext ? Context(file: file, line: line) : nil)
    }
    
    fileprivate func handleLog(level: Level, message: String, context: Context?) {
        // Current log level is lower than the one specified in config. Skip logging.
        if level.rawValue < minLevel.rawValue {
            return
        }
        
        let levelComponent = "[\(level.toIcon)\(level.toString)]"
        if let ctx = context {
            let prefix = [levelComponent, name, "\(ctx.description)"].joined(separator: " ")
            print("\(prefix) - \(message)")
        } else {
            let prefix = [levelComponent, name].joined(separator: " ")
            print("\(prefix) - \(message)")
        }
    }
}
