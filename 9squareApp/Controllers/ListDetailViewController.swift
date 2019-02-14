//
//  EventDetailViewController.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {

    var detailView = ListDetailView()
    var eventName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
    }
    
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        self.detailView.eventDetailLabel.text = name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

