//
//  CityListViewController.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 28/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class CityListViewController: BaseViewController {

    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var viewModel: CityListViewModel!

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
        self.tableView.delegate = self.viewModel
        self.tableView.dataSource = self.viewModel
    }
    
    private func setupUI() {
        self.view.addSubviews(
            self.searchBar,
            self.button_Back,
            self.view_TopSeparator,
            self.tableView
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

        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.view_TopSeparator.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

    }
    
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CityListViewModel(cityListController: self)
        self.setupUI()
        self.setupBindings()
    }
}

// MARK: - CityListDelegate

extension CityListViewController: CityListDelegate {
    func reloadData() {
        self.tableView.reloadData()
    }
}
