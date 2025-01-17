//
//  ViewControllersFactory.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation

final class ViewControllersFactory:ViewControllersFactoryProtocol {
    func makeSplashViewControl(flowDelegate: SplashFlowDelegate)->SplashViewController{
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView, 
                                                  flowDelegate: flowDelegate)
        
        return viewController
    }
    
    func makeHomeViewController()->HomeViewController{
        let contentView = HomeView()
        let viewController = HomeViewController(contentView: contentView)
        
        return viewController
    }
}

