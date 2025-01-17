//
//  HomeViewModel.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation
import MapKit

class HomeViewModel:NSObject {
    private let service = OpenWeatherService()
    private var city = City(lat: "-3.799059", lon: "-38.462626", name: "Fortaleza")
    private var forecastResponse:ForecastResponse?
    private let locationManager = CLLocationManager()
    weak var delegate: HomeViewModelDelegate?
    
    init(delegate: HomeViewModelDelegate? = nil) {
        super.init()
        self.delegate = delegate
        requestUserLocation()
        fetchData()
    }

    
    private func fetchData(){
        delegate?.loading(isLoading: true)
        
        service.fetchData(for: city) { [weak self] forecast in
            guard let forecast, let city = self?.city else { return }
            self?.forecastResponse = forecast
            self?.delegate?.loading(isLoading: false)
            DispatchQueue.main.async {
                self?.delegate?.forecastDidUpdate(forecast: forecast, city: city)
            }
        }
    }
    
    private func requestUserLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func startLocationUpdate(){
        let customQueue = DispatchQueue(label:"weatherAppQueue")
        customQueue.async { [weak self] in
            if CLLocationManager.locationServicesEnabled() {
                self?.locationManager.startUpdatingLocation()
            }
        }
    }
}



extension HomeViewModel:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        guard let userLocation else { return }
        
        let geocoder = CLGeocoder()
        
        Task {
            do {
                let placeMarks = try await geocoder.reverseGeocodeLocation(userLocation)
                
                guard let placeMark = placeMarks.first else { return }
                
                
                let locatioName = "\(placeMark.locality ?? "Desconhecido"), \(placeMark.administrativeArea ?? "Desconhecido")"
                
                city = City(lat: String(userLocation.coordinate.latitude),
                            lon: String(userLocation.coordinate.longitude),
                            name: locatioName)
                
                manager.stopUpdatingLocation()
                
                fetchData()
            } catch {
                print("Unable to reverseGeocodeLocation")
            }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .notDetermined:
                print(manager.authorizationStatus)
            case .restricted:
                print(manager.authorizationStatus)
            case .denied:
                print(manager.authorizationStatus)
            case .authorizedAlways:
                startLocationUpdate()
            case .authorizedWhenInUse:
                startLocationUpdate()
            @unknown default:
                print("unknown authorizationStatus \(manager.authorizationStatus)")
        }
        
    }
}
