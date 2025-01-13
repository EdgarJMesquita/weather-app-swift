//
//  ViewController.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 08/01/25.
//

import UIKit

class ViewController: UIViewController {
    var mock:[TemperaturePerHour] = [
        TemperaturePerHour(hour: "07:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "08:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "09:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "10:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "11:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "12:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "13:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "14:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "15:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "16:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
        TemperaturePerHour(hour: "17:00", icon: UIImage(named: "sunIcon")!, temperature: 25),
    ]
    
    private lazy var backgroundImageView:UIImageView = {
        let imageView = UIImageView()
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour >= 6 && hour <= 18 {
            imageView.image = UIImage.backgroundDay
        } else {
            imageView.image = UIImage.backgroundNight
        }
        
     
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
        return view
    }()
    
    private lazy var cityLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Fortaleza"
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private lazy var temperatureLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = "25°C"
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private lazy var weatherIcon:UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var humidityHeaderView:UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = UIColor(named: "subHeaderBackgroundColor")
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
        return view
    }()
    
    private lazy var humidityCell:HomeSubHeaderRow = {
        let customStackView = HomeSubHeaderRow(label: "Umidade", value: "1000mm")
        return customStackView
    }()
    
    private lazy var windCell:HomeSubHeaderRow = {
        let customStackView = HomeSubHeaderRow(label: "Umidade", value: "10km/h")
        return customStackView
    }()
    
    private lazy var hourlyPredictionTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PREVISÃO POR HORA"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var collectionView:UICollectionView = {
        let collectionView = HomeCustomCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var nextDayTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PROXIMOS DIAS"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var customTableView:HomeCustomTableView = {
        let tableView = HomeCustomTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var topConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .systemBackground
        setHierarchy()
        setupConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(backgroundImageView)
        view.addSubview(headerView)
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
        
        view.addSubview(humidityHeaderView)
        
        humidityHeaderView.addArrangedSubview(humidityCell)
        humidityHeaderView.addArrangedSubview(windCell)
    
        view.addSubview(hourlyPredictionTitle)
        
        view.addSubview(collectionView)
        view.addSubview(nextDayTitle)
        view.addSubview(customTableView)
        
    }
    
    private func setupConstraints(){
        // MARK: BackgroundImageView
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // MARK: HeaderView
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        
        // MARK: CityLabel
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 13),
            cityLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
        ])
        
        // MARK: TemperatureLabel
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
        ])
        
        // MARK: WeatherIcon
        NSLayoutConstraint.activate([
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
        ])
        
        // MARK: SubHeaderStackView
        NSLayoutConstraint.activate([
            humidityHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            humidityHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // MARK: HourlyPredictionTitle
        NSLayoutConstraint.activate([
            hourlyPredictionTitle.topAnchor.constraint(equalTo: humidityHeaderView.bottomAnchor, constant: 22),
            hourlyPredictionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // MARK: CollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: hourlyPredictionTitle.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        // MARK: NextDayTitle
        NSLayoutConstraint.activate([
            nextDayTitle.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            nextDayTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // MARK: CustomTableView
        NSLayoutConstraint.activate([
            customTableView.topAnchor.constraint(equalTo: nextDayTitle.bottomAnchor, constant: 10),
            customTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 36),
            customTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -36),
            customTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
}
