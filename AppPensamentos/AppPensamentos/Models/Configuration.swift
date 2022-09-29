//
//  Configuration.swift
//  AppPensamentos
//
//  Created by Gabriel Carvalho on 26/09/22.
//

import UIKit

class Configuration {
    
    let defaults = UserDefaults.standard
    
    enum configurationOptions: String {
        case timeRefresh = "timeRefresh"
        case colorScheme = "ColorScheme"
        case autoRefresh = "autoRefresh"
    }
    
    
    
    static var shared: Configuration = Configuration()
    
    var timeRefresh: Double {
        
        get {
            return defaults.double(forKey: configurationOptions.timeRefresh.rawValue)
        }
        
        set {
            defaults.set(newValue, forKey: configurationOptions.timeRefresh.rawValue)
        }
    }
    
    var colorScheme: Int {
        
        get {
            return defaults.integer(forKey: configurationOptions.colorScheme.rawValue)
        }
        
        set {
            defaults.set(newValue, forKey: configurationOptions.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        
        get {
            return defaults.bool(forKey: configurationOptions.autoRefresh.rawValue)
        }
        
        set {
            defaults.set(newValue, forKey: configurationOptions.autoRefresh.rawValue)
        }
    }
    
    
    private init() {
        
        if defaults.double(forKey: configurationOptions.timeRefresh.rawValue) == 0 {
            defaults.set(8.0, forKey: configurationOptions.timeRefresh.rawValue)
        }
        
    }
    
}
