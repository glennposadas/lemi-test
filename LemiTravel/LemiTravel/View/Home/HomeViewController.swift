//
//  HomeViewController.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 28/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    private lazy var button_SelectCity: UIButton = {
        return UIButton.new(
            withIcon: UIImage(named: "ic_select_city"),
            title: "Tap to select a city".localized(),
            normalTextColor: .black,
            highlightedTextColor: .darkGray,
            backgroundColor: .white,
            horizontalAlignment: .leading
        )
    }()
    
    // MARK: - Functions
    
    private func setupBindings() {
        weak var weakSelf = self
        
        self.button_SelectCity.rx.tap.subscribe { _ in
            weakSelf?.viewModel.selectCity()
        }.disposed(by: self.disposeBag)
    }
    
    private func setupUI() {
        self.view.addSubview(self.button_SelectCity)
        self.button_SelectCity.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(50.0)
        }

    }
    
    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = HomeViewModel(homeController: self)
        
        self.setupUI()
        self.setupBindings()
    }
}

// MARK: - HomeDelegate

extension HomeViewController: HomeDelegate {
    func showCityList() {
        let cityListController = CityListViewController()
        self.navigationController?.pushViewController(cityListController, animated: true)
    }
}
