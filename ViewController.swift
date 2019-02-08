//
//  ViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var detailView = SearchDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("We got here")
        view.addSubview(detailView)
    }


}

