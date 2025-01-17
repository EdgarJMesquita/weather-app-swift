//
//  FlowCoordinator.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation
import UIKit


class FlowCoordinator {
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactory
    
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    func start()->UINavigationController? {
        let viewController = viewControllerFactory.makeSplashViewControl(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: viewController)
        return self.navigationController
    }
}


extension FlowCoordinator:SplashFlowDelegate {
    func decideNavigationFlow() {
        let viewController = viewControllerFactory.makeHomeViewController()
        navigationController?.setViewControllers([viewController], animated: false)
    }
}
