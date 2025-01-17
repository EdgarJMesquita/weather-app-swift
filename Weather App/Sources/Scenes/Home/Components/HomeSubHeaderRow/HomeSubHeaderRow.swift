//
//  HomeHeaderSubviewCell.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 11/01/25.
//

import Foundation
import UIKit

class HomeSubHeaderRow:UIStackView,ViewCodeProtocol {
    private lazy var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Vento"
        label.textColor = UIColor.contrast
        return label
    }()
    
    private lazy var value:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "10km/h"
        label.textColor = UIColor.contrast
        return label
    }()
    
    init(label: String) {
        super.init(frame: .zero)
        self.label.text = label
   
        setupView()
        setupHierarchy()
    }
    
    internal func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 26
    }
    
    internal func setupHierarchy(){
        addArrangedSubview(label)
        addArrangedSubview(value)
    }
    
    func setupConstraints() {}

    func setData(value: String){
        self.value.text = value
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
