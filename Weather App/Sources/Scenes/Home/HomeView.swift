//
//  HomeView.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 14/01/25.
//

import Foundation
import UIKit

class HomeView:UIView, ViewCodeProtocol {
    private lazy var backgroundImageView:UIImageView = {
        let imageView = UIImageView()
        if isDay() {
            imageView.image = .backgroundDay
        } else {
            imageView.image = .backgroundNight
        }
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var headerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width:0,height:4)
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        view.alpha = 0
        return view
    }()
    
    private lazy var cityLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
       
        label.textColor = .appPrimary
        label.alpha = 0
        return label
    }()
    
    private lazy var temperatureLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
     
        label.textColor = .appPrimary
        label.alpha = 0
        return label
    }()
    
    private lazy var weatherIcon:UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        return imageView
    }()
    
    private lazy var humidityHeaderView:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = UIColor.subHeaderBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width:0,height:4)
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        
        view.spacing = 10
        
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                leading: 12,
                                                                bottom: 12,
                                                                trailing: 12)
        view.isLayoutMarginsRelativeArrangement = true
        
        view.alpha = 0
        return view
    }()
    
    private lazy var humidityCell:HomeSubHeaderRow = {
        let customStackView = HomeSubHeaderRow(label: "Umidade")
        customStackView.alpha = 0
        return customStackView
    }()
    
    private lazy var windCell:HomeSubHeaderRow = {
        let customStackView = HomeSubHeaderRow(label: "Vento")
        customStackView.alpha = 0
        return customStackView
    }()
    
    private lazy var hourlyPredictionTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PREVISÃO POR HORA"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.alpha = 0
        return label
    }()
    
    private lazy var collectionView:HomeCustomCollectionView = {
        let collectionView = HomeCustomCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alpha = 0
        return collectionView
    }()
    
    private lazy var nextDayTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PROXIMOS DIAS"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.alpha = 0
        return label
    }()
    
    private lazy var customTableView:HomeCustomTableView = {
        let tableView = HomeCustomTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.alpha = 0
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func setupView(){
        backgroundColor = .systemBackground
        setupHierarchy()
        setupConstraints()
        activityIndicator.startAnimating()
    }

    func startLoading(){
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        setUIAlpha(to: 0)
    }
    
    func stopLoading(){
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
       
        }
        setUIAlpha(to: 1)
    }
  
    
    private func setUIAlpha(to alpha: Double){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.5, animations: { [weak self] in
                self?.headerView.alpha = alpha
                self?.cityLabel.alpha = alpha
                self?.temperatureLabel.alpha = alpha
                self?.weatherIcon.alpha = alpha
                self?.humidityHeaderView.alpha = alpha
                self?.humidityCell.alpha = alpha
                self?.windCell.alpha = alpha
                self?.hourlyPredictionTitle.alpha = alpha
                self?.collectionView.alpha = alpha
                self?.nextDayTitle.alpha = alpha
                self?.customTableView.alpha = alpha
            })
        }
    }
    
    internal func setupHierarchy(){
        addSubview(backgroundImageView)
        addSubview(activityIndicator)
        
        addSubview(headerView)
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
        
        addSubview(humidityHeaderView)
        humidityHeaderView.addArrangedSubview(humidityCell)
        humidityHeaderView.addArrangedSubview(windCell)
    
        addSubview(hourlyPredictionTitle)
        addSubview(collectionView)
        addSubview(nextDayTitle)
        addSubview(customTableView)
    }
    
    // MARK: configureData
    func configureData(with forecast: ForecastResponse, city: City){
        cityLabel.text = city.name
        temperatureLabel.text = forecast.current.temp.toCelsius()
        humidityCell.setData(value: "\(forecast.current.humidity)mm")
        windCell.setData(value: "\(forecast.current.windSpeed)km/h")
        collectionView.setData(with: forecast.hourly)
        customTableView.setData(with: forecast.daily)
        
        if let icon = forecast.current.weather.first?.icon {
            weatherIcon.loadIconFromOpenWeather(with: icon)
            if icon == "Clouds" {
                backgroundImageView.image = .backgroundThunder
            }
        }
        
        stopLoading()
    }
    
    private func isDay()->Bool{
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= 6 && hour <= 18
    }
    
    internal func setupConstraints(){
        // MARK: BackgroundImageView
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        // MARK: ActivityIndicator
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        // MARK: HeaderView
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        // MARK: CityLabel
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 13),
            cityLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // MARK: TemperatureLabel
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 71)
        ])
        
        // MARK: WeatherIcon
        NSLayoutConstraint.activate([
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 150),
            weatherIcon.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        // MARK: SubHeaderStackView
        NSLayoutConstraint.activate([
            humidityHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            humidityHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        // MARK: HourlyPredictionTitle
        NSLayoutConstraint.activate([
            hourlyPredictionTitle.topAnchor.constraint(equalTo: humidityHeaderView.bottomAnchor, constant: 22),
            hourlyPredictionTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        // MARK: CollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: hourlyPredictionTitle.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        // MARK: NextDayTitle
        NSLayoutConstraint.activate([
            nextDayTitle.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            nextDayTitle.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        // MARK: CustomTableView
        NSLayoutConstraint.activate([
            customTableView.topAnchor.constraint(equalTo: nextDayTitle.bottomAnchor, constant: 10),
            customTableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 36),
            customTableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -36),
            customTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
}
