//
//  CityTableViewCell.swift
//  LemiTravel
//
//  Created by Glenn Von C. Posadas on 29/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

class CityTableViewCell: BaseTableViewCell {
    
    // MARK: - Properties
    
    private lazy var imageView_Avatar: UIImageView = {
        return UIImageView.new(withImageName: nil, contentMode: .scaleAspectFill)
    }()
    
    private lazy var label_Title: UILabel = {
        return UILabel.new(withText: "".localized(), fontSize: 15.0, weight: .medium)
    }()
    
    private lazy var label_Subtitle: UILabel = {
        return UILabel.new(withText: "".localized(), fontSize: 12.0)
    }()
    
    private lazy var stackView_Labels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.label_Title, self.label_Subtitle])
        stackView.axis = .vertical
        stackView.spacing = 4.0
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: - Functions
    
    func setupCell(_ city: City?) {
        self.label_Title.text = city?.namePresentable
        self.label_Subtitle.text = city?.countryPresentable
        
        if let resource = city?.bannerResource {
            self.imageView_Avatar.kf.setImage(with: resource, options: [.transition(.fade(0.2)), .cacheOriginalImage])
            return
        }
        
        self.imageView_Avatar.image = city?.avatarFromName
    }
    
    // MARK: Overrides
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.removeSeparator()
        
        self.addSubviews(
            self.imageView_Avatar,
            self.stackView_Labels
        )
        
        self.imageView_Avatar.snp.makeConstraints {
            $0.width.height.equalTo(30.0)
            $0.top.leading.bottom.equalToSuperview().inset(16.0)
        }
        
        self.stackView_Labels.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.stackView_Labels.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

