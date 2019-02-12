//
//  ViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    let mainSearchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.3)
    self.view.addSubview(mainSearchView)
    }
    
    
}
