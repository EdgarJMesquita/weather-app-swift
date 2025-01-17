//
//  SplashViewController.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    private let contentView: SplashView
    weak var flowDelegate:SplashFlowDelegate?
    
    init(contentView: SplashView, flowDelegate:SplashFlowDelegate) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        self.flowDelegate = flowDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setup()
        startBreathing()
    }
    
    private func setup(){
        view.addSubview(contentView)
        setupContentViewToViewController(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func decideFlow(){
        self.flowDelegate?.decideNavigationFlow()
    }
}

extension SplashViewController {
    private func startBreathing(){
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 1.5,delay: 0.0, animations: {
            let transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.contentView.imageView.transform = transform
        },
           completion: { _ in
            self.decideFlow()
        })
    }
}
