//
//  tableViewCell.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    public lazy var thumbnail: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        image.image = UIImage.init(named: "background_1")
        return image
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumbnail)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit(){
        setUpTableView()
    }
    
    
    func setUpTableView(){
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        thumbnail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -600).isActive = true
        thumbnail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

    


}
