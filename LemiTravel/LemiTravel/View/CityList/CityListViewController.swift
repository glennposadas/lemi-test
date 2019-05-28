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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 200.0
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    
    
    // MARK: - Functions
    
    private func setupBindings() {
        
    }
    
    private func setupUI() {
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
