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
        tv.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        tv.sectionIndexColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        tv.rowHeight = 150
        tv.allowsSelection = false
        tv.backgroundColor = #colorLiteral(red: 1, green: 0.9801799655, blue: 0.7814953923, alpha: 1)
        return tv 
    }()
    
  
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        self.favTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        
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
    
   
}
