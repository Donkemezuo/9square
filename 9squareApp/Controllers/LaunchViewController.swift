//
//  LaunchViewController.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/21/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    let launchView = LaunchView()
    
    
    override func viewWillLayoutSubviews() {
        self.launchView.launchImage.backgroundColor = .white 
        self.launchView.launchImage.layer.cornerRadius = self.launchView.launchImage.frame.size.width / 2 
        self.launchView.launchImage.clipsToBounds = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.addSubview(launchView)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                UIView.animate(withDuration: 0.40, delay: 0, options: [.repeat, .curveEaseIn], animations: {
            self.launchView.launchImage.transform = CGAffineTransform(rotationAngle: .pi / 2)
        })

    }
    


}
