//
//  HomeCustomTableViewCell.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 13/01/25.
//

import Foundation
import UIKit

class HomeCustomTableViewCell: UITableViewCell {
    static let identifier = "myCustomTableViewCell"
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
       
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 6, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    private lazy var dayOfWeekLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private lazy var minTemperaturaStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .bottom
        return stackView
    }()
    
    private lazy var minTemperatureLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "min"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var minTemperatureValue:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperaturaStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .bottom
        return stackView
    }()
    
    private lazy var maxTemperatureLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "max"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperatureValue:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func configure(with weekDayReading:WeekDayReading){
        dayOfWeekLabel.text = weekDayReading.dayOfWeek
        iconImageView.image = weekDayReading.icon
        minTemperatureValue.text = String(weekDayReading.min)
        maxTemperatureValue.text = String(weekDayReading.max)
    }
    
    private func setupView(){
        setupHierarchy()
        setupConstraints()
        backgroundColor = .clear

    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(dayOfWeekLabel)
        stackView.addArrangedSubview(iconImageView)
        
        stackView.addArrangedSubview(minTemperaturaStackView)
        
        minTemperaturaStackView.addArrangedSubview(minTemperatureLabel)
        minTemperaturaStackView.addArrangedSubview(minTemperatureValue)
        
        stackView.addArrangedSubview(maxTemperaturaStackView)
        maxTemperaturaStackView.addArrangedSubview(maxTemperatureLabel)
        maxTemperaturaStackView.addArrangedSubview(maxTemperatureValue)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
         
            
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
