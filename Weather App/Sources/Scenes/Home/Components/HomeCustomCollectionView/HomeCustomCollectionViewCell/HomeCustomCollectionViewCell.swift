//
//  HomeHourlyPredictionCell.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 12/01/25.
//

import Foundation
import UIKit

class HomeCustomCollectionViewCell:UICollectionViewCell {
    static let identifier = "myTableViewCel"

    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView(){
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        setupHierarchy()
        setupConstraints()
    }
    
    func configure(with forecast: Forecast ){
        hourLabel.text = forecast.dt.toHourFormat()
        temperatureLabel.text = forecast.temp.toCelsius()
        
        if let icon = forecast.weather.first?.icon {
            iconView.loadIconFromOpenWeather(with: icon)
        }
    }
    
    private func setupHierarchy(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(hourLabel)
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(temperatureLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            iconView.widthAnchor.constraint(equalToConstant: 48),
            iconView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
