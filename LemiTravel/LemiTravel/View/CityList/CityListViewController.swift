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

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a city".localized()
        searchBar.setPositionAdjustment(UIOffset(horizontal: 35.0, vertical: 0), for: .search)
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    private lazy var view_TopSeparator: UIView = {
        return UIView.new(backgroundColor: .lightGray)
    }()
    
    // MARK: - Functions
    
    private func setupBindings() {
        
    }
    
    private func setupUI() {
        self.view.addSubviews(
            self.searchBar,
            self.button_Back,
            self.view_TopSeparator
        )
        
        self.searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.button_Back.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8.0)
            $0.centerY.equalTo(self.searchBar)
            $0.width.height.equalTo(44.0)
        }

        self.view_TopSeparator.snp.makeConstraints {
            $0.height.equalTo(1.0)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.searchBar.snp.bottom)
        }

    }
    
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupBindings()
    }
}
