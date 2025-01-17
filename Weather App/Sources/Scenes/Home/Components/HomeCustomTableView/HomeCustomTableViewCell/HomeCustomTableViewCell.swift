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
       
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
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
    
    private lazy var iconImageContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    func configure(with dailyForecast:DailyForecast){
        dayOfWeekLabel.text = dailyForecast.dt.toWeekdayName().uppercased()

        if let icon = dailyForecast.weather.first?.icon {
            iconImageView.loadIconFromOpenWeather(with: icon)
        }
        
        minTemperatureValue.text = dailyForecast.temp.min.toCelsius()
        maxTemperatureValue.text = dailyForecast.temp.max.toCelsius()
    }
    
    private func setupView(){
        setupHierarchy()
        setupConstraints()
        backgroundColor = .clear

    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(dayOfWeekLabel)
        
        iconImageContainer.addSubview(iconImageView)
        stackView.addArrangedSubview(iconImageContainer)
        
//        stackView.addArrangedSubview(iconImageView)
        
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
         
            dayOfWeekLabel.widthAnchor.constraint(equalToConstant: 35),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.centerXAnchor.constraint(equalTo: iconImageContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconImageContainer.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
