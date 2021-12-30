//
//  Logger.swift
//  OhMyLog
//
//  Created by Junhao Wang on 12/9/21.
//

import Foundation

public class Logger {
    public enum Defaults {
        public static let loggerName = "Default"
        public static let logLevel = Logger.Level.debug
        public static let showLevelIcon = false
        public static let showContext = true
    }
    
    public enum Level: Int {
        case trace
        case debug
        case info
        case warn
        case error
        case fatal
        
        var toString: String {
            switch self {
            case .trace:  return "TRACE"
            case .debug:  return "DEBUG"
            case .info:   return "INFO^"
            case .warn:   return "WARN^"
            case .error:  return "ERROR"
            case .fatal:  return "FATAL"
            }
        }
        
        var toIcon: String {
            switch self {
            case .trace:  return "🟤"
            case .debug:  return "🟢"
            case .info:   return "⚪️"
            case .warn:   return "🟡"
            case .error:  return "🔴"
            case .fatal:  return "🚨"
            }
        }
    }
    
    struct Context {
        let file: String
        let line: UInt
        
        var description: String {
            return "\(URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent).\(line)"
        }
    }
    
    public let name: String
    public var logLevel: Level
    public var showLevelIcon: Bool
    public var showContext: Bool
    
    let dateFormatter: DateFormatter = DateFormatter()
    static let timePattern = "[hh:mm:ss.SSS]"
    
    public init(name: String, level: Level = Defaults.logLevel) {
        self.name = name.isEmpty ? Defaults.loggerName : name
        self.logLevel = level
        self.showLevelIcon = Defaults.showLevelIcon
        self.showContext = Defaults.showContext
        
        dateFormatter.dateFormat = Self.timePattern
    }
}
