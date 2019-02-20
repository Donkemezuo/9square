//
//  FavoriteView.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/19/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    
    public lazy var favTableView: UITableView = {
       var tv = UITableView()
        tv = UITableView(frame: .zero, style: .plain)
        tv.rowHeight = 150
        return tv 
    }()
    
    public lazy var favImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "food"))
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit(){
        setConstraints()
    }
    
    func setConstraints() {
        addSubview(favTableView)
        favTableView.translatesAutoresizingMaskIntoConstraints = false
        favTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        favTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        favTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setImageConstraints() {
       addSubview(favImage)
        favImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
