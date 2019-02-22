//
//  FavoriteTableViewCell.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/20/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    public lazy var favImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "food"))
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    public lazy var favLabel: UILabel = {
        var label = UILabel()
        label.text = "Fave label"
        label.font = UIFont(name: "Copperplate-Bold", size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Copperplate-Bold", size: 15)
        label.textColor = .black
        return label
    }()
    
    public lazy var timeFavoritedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Copperplate-Bold", size: 15)
        label.textColor = .white 
        label.numberOfLines = 0
        return label
        
    }()
    
    public lazy var view: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        return view
    }()
    
    func setConstraints() {
        addSubview(view)
        view.addSubview(addressLabel)
        view.addSubview(favImage)
        view.addSubview(favLabel)
        view.addSubview(timeFavoritedLabel)
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        favImage.translatesAutoresizingMaskIntoConstraints = false
        favLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        timeFavoritedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
       
        favImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        favImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -260).isActive = true
        favImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        favImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        favLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        favLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        favLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        favLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
       
        addressLabel.topAnchor.constraint(equalTo: favLabel.bottomAnchor, constant: -50).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        timeFavoritedLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 5).isActive = true
        timeFavoritedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        timeFavoritedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        timeFavoritedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        
       
        
    
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setConstraints()
    }
   

}
