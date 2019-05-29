//
//  CityListViewModel.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 29/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

/// The delegate of the ```CityListViewModel```
protocol CityListDelegate: class {
    func reloadData()
    func goToHome()
}

class CityListViewModel: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: CityListDelegate?
    
    var cities = BehaviorRelay<[City]>(value: [])
    
    // MARK: Functions
    
    /// init
    init(cityListController: CityListDelegate) {
        super.init()
        
        self.delegate = cityListController
        
        let data = stubbedResponse("Cities")!
        let newCities = try? JSONDecoder().decode([City].self, from: data)
        self.cities.accept(newCities!)
        self.delegate?.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension CityListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Select and add city to shared data
        let city = self.cities.value[indexPath.row]
        LTSharedData.selectedCities.accept(LTSharedData.selectedCities.value + [city])
        self.delegate?.goToHome()
    }
}

// MARK: - UITableViewDataSource

extension CityListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CityTableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell
        
        if cell == nil {
            cell = CityTableViewCell()
        }
        
        let city = self.cities.value[indexPath.row]
        cell?.setupCell(city)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.value.count
    }
}
