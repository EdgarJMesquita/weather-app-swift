//
//  HomeCustomTableView.swift
//  Weather App
//
//  Created by Edgar Jonas Mesquita da Silva on 13/01/25.
//

import Foundation
import UIKit

class HomeCustomTableView:UITableView {
    private var data:[DailyForecast] = []

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    private func setupView(){
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        register(HomeCustomTableViewCell.self, forCellReuseIdentifier: HomeCustomTableViewCell.identifier)
        backgroundColor = .clear

        rowHeight = 40
        separatorColor = .white.withAlphaComponent(0.30)
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        allowsSelection = false
   
    }
    
    func setData(with data: [DailyForecast]){
        self.data = data
        reloadData()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCustomTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCustomTableViewCell.identifier, for: indexPath) as? HomeCustomTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
    
    
}
