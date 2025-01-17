//
//  ViewController.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 08/01/25.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    private let contentView: HomeView
    private let viewModel: HomeViewModel

    init(contentView: HomeView) {
        self.viewModel = HomeViewModel()
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
        
    }
    
    private func bindViewModel(){
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup(){
        view.addSubview(contentView)
        setupContentViewToViewController(contentView: contentView)
    }

}

extension HomeViewController:HomeViewModelDelegate {
    func loading(isLoading: Bool) {
        if isLoading {
            contentView.startLoading()
        } else {
            contentView.stopLoading()
        }
    }
    
    func forecastDidUpdate(forecast: ForecastResponse, city:City) {
        contentView.configureData(with: forecast, city: city)
    }
    
}
