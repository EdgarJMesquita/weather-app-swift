//
//  UIViewController+Extensions.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 14/01/25.
//

import Foundation
import UIKit

extension UIViewController {
    public func setupContentViewToViewController(contentView:UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
