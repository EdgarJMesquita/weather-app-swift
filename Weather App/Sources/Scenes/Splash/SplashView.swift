//
//  SplashView.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 16/01/25.
//

import Foundation
import UIKit

class SplashView:UIView, ViewCodeProtocol {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    internal func setupView(){
        setupHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    internal func setupHierarchy(){
        addSubview(imageView)
    }
    
    internal func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
//            imageView.heightAnchor.constraint(equalToConstant: 251),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
