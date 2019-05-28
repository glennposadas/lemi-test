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

/// The delegate of the ```HomeViewModel```
protocol HomeDelegate: class {
    func showCityList()
}

class HomeViewModel {
    
    // MARK: - Properties
    
    weak var delegate: HomeDelegate?
    
    // MARK: Functions
    
    /// init
    init(homeController: HomeDelegate?) {
        self.delegate = homeController
    }
    
    // MARK: Button Events
    
    /// Selector for select city button
    func selectCity() {
        self.delegate?.showCityList()
    }
    
}
