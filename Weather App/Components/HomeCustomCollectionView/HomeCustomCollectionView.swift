//
//  HomeCustomCollectionView.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 13/01/25.
//

import Foundation
import UIKit

class HomeCustomCollectionView: UICollectionView {
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
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 77, height: 94)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.minimumLineSpacing = 9
        super.init(frame: .zero, collectionViewLayout: layout)
        
        setupView()
    }
    
    private func setupView(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        showsHorizontalScrollIndicator = false
        
        dataSource = self
        
        register(HomeCustomCollectionViewCell.self,
                 forCellWithReuseIdentifier: HomeCustomCollectionViewCell.identifier)
    }
    
    func setData(with data: [TemperaturePerHour]){
        mock = data
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCustomCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCustomCollectionViewCell.identifier, for: indexPath) as? HomeCustomCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: mock[indexPath.row])
        
        return cell
    }
    
 
}




