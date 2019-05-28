//
//  HomeViewModel.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 28/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

enum HomeSectionType: Int {
    case selectCity
    case selectedCities
    
    static let count: Int = 2
}

/// The delegate of the ```HomeViewModel```
protocol HomeDelegate: class {
    func showCityList()
    func reloadData()
}

class HomeViewModel: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: HomeDelegate?
    
    private var cities = [City]()
    
    // MARK: Functions
    
    /// init
    init(homeController: HomeDelegate?) {
        self.delegate = homeController
        
        
    }
    
    // MARK: Button Events
    
    /// Selector for select city button
    /// Update: button was changed to tableViewCell
    func selectCity() {
        self.delegate?.showCityList()
    }
    
}

// MARK: - UITableViewDelegate

extension HomeViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.selectCity()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: HomeTableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        
        if cell == nil {
            cell = HomeTableViewCell()
        }
        
        let section = indexPath.section
        let row = indexPath.row
        
        if let homeSectionType = HomeSectionType(rawValue: section) {
            switch homeSectionType {
            case .selectCity:
                cell?.setupCell(nil)
            case .selectedCities:
                cell?.setupCell(self.cities[row])
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let homeSectionType = HomeSectionType(rawValue: section) {
            switch homeSectionType {
            case .selectCity: return 1
            case .selectedCities: return self.cities.count
            }
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSectionType.count
    }
}
