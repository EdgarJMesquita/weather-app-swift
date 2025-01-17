//
//  UIImage+Extension.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 15/01/25.
//

import Foundation
import UIKit

extension UIImageView {
    func loadIconFromOpenWeather(with iconName:String){
        let urlString = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ data,_,error in
            if let error {
                print("Error in in UIImage.fromRemoteURL(from urlString:String) \(error)")
                return
            }
            
            guard let data else {
                print("Data is empty in UIImage.fromRemoteURL(from urlString:String)")
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("Unable to get contents in UIImage.fromRemoteURL(from urlString:String)")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
