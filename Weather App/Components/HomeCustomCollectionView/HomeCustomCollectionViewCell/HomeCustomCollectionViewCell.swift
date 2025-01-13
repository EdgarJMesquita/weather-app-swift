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
    
    func configure(with temperaturePerHour: TemperaturePerHour ){
        hourLabel.text = temperaturePerHour.hour
        iconView.image = temperaturePerHour.icon
        temperatureLabel.text = "\(temperaturePerHour.temperature)°C"
    }
    
    private func setupHierarchy(){
        contentView.addSubview(hourLabel)
        contentView.addSubview(iconView)
        contentView.addSubview(temperatureLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([

            hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 9),
            hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 7),
            hourLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -7),

            iconView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 8),
            iconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 33),
            iconView.heightAnchor.constraint(equalToConstant: 33),
            
            temperatureLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 8),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
