//
//  ViewControllersFactoryProtocol.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation

protocol ViewControllersFactoryProtocol:AnyObject {
    func makeSplashViewControl(flowDelegate: SplashFlowDelegate)->SplashViewController
    
    func makeHomeViewController()->HomeViewController
}
