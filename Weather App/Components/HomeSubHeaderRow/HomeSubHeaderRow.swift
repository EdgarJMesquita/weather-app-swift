//
//  HomeHeaderSubviewCell.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 11/01/25.
//

import Foundation
import UIKit

class HomeSubHeaderRow:UIStackView {

    private lazy var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Vento"
        label.textColor = UIColor.constrastColor
        return label
    }()
    
    
    private lazy var value:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "10km/h"
        label.textColor = UIColor.constrastColor
        return label
    }()
    
    init(label: String, value: String) {
        super.init(frame: .zero)
        self.label.text = label
        self.value.text = value
        
        setupView()
        setupHierarchy()
    }
    
    private func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 26
    }
    
    private func setupHierarchy(){
        addArrangedSubview(label)
        addArrangedSubview(value)
    }

    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
