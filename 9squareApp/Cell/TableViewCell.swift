//
//  TableViewCell.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/20/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    public lazy var favImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "food"))
        
        return image
        
    }()
    
    public lazy var favLabel: UILabel = {
        var label = UILabel()
        label.text = "Fave label"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    public lazy var view: UIView = {
        var view = UIView()
        
        return view
    }()
    
    func setConstraints() {
        addSubview(view)
        view.addSubview(favImage)
        view.addSubview(favLabel)
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        favImage.translatesAutoresizingMaskIntoConstraints = false
        favLabel.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
       
        favImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        favImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        favImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        favImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        favLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        favLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 250).isActive = true
        favLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        favLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
       
        
    
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
