//
//  SearchCollectionViewCell.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/14/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .gray
        ai.hidesWhenStopped = true
        return ai
    }()
    
    public lazy var imageView: UIImageView = {
        let restuarantImageView = UIImageView()
            restuarantImageView.image = UIImage.init(named: "food")
            return restuarantImageView
        
    }()
    
    public lazy var nameLabel: UILabel = {
        let restuarantName = UILabel()
            restuarantName.numberOfLines = 0
            restuarantName.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        return restuarantName
        
    }()
    
    public lazy var addressLabel: UILabel = {
        let restuarantAddress = UILabel()
            restuarantAddress.numberOfLines = 0
            restuarantAddress.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        return restuarantAddress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    private func commonInt(){
        setConstrains()
    }
    
    private func setConstrains() {
        
        addSubview(imageView)
        addSubview(addressLabel)
        addSubview(nameLabel)
        addSubview(activityIndicator)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints =  false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
        
    }
}
