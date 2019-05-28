//
//  CityListViewController.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 28/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

class CityListViewController: BaseViewController {

    // MARK: - Properties
    
    private lazy var view_NavBar: UIView = {
        return UIView.new(backgroundColor: .white)
    }()
    
    private lazy var view_NavBarSeparator: UIView = {
        return UIView.new(backgroundColor: .lightGray)
    }()
    
    // MARK: - Functions
    
    private func setupBindings() {
        
    }
    
    private func setupUI() {
        //self.view_NavBar.addSubviews(<#T##views: UIView...##UIView#>)
        
        let backBarButton = UIBarButtonItem(customView: self.button_Back)
        self.button_Back.frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        self.navigationItem.leftBarButtonItem = backBarButton
        
        self.button_Back.setImage(UIImage(named: "ic_back"), for: .normal)
    }
    
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupBindings()
    }
}
