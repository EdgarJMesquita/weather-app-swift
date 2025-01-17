//
//  Core+Extensions.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 15/01/25.
//

import Foundation

extension Int {
    func toWeekdayName() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // "EE" represents the full weekday name
        dateFormatter.locale = Locale(identifier: "pt_BR")
        
        return dateFormatter.string(from: date)
    }
    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // "HH:mm" represents the 24-hour format
       
        return dateFormatter.string(from: date)
    }
}

extension Double {
    func toCelsius () -> String {
        "\(Int(self))°C"
    }
}
