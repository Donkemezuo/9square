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
        return tv 
    }()

}
