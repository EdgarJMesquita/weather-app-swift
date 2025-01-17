//
//  Service.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 14/01/25.
//

import Foundation

class OpenWeatherService {
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    
    func fetchData(for city:City, _ completion: @escaping (ForecastResponse?)->Void){
        
        guard let apiKey = EnvManager.getValueFor(.openWeatherAPIKey) else {
            completion(nil)
            print("Unable to recover configuration files.")
            return
        }
        
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let forecastResponse = try decoder.decode(ForecastResponse.self, from: data)
                
                completion(forecastResponse)
            } catch {
                print(error)
                completion(nil)
            }
            
        }.resume()
    }
}
