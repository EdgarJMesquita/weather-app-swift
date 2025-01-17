//
//  HomeViewModelDelegate.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation

protocol HomeViewModelDelegate:AnyObject {
    func loading(isLoading:Bool)
    
    func forecastDidUpdate(forecast: ForecastResponse, city:City)
}
