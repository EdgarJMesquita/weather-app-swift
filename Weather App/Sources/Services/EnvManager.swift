//
//  EnvManager.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 17/01/25.
//

import Foundation

final class EnvManager {
    enum Key:String {
        case openWeatherAPIKey = "OpenWeatherAPIKey"
    }
    
    static func getValueFor(_ key:Key)->String? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String 
        else { return nil }
        return value
    }
}
