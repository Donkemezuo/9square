//
//  LaunchView.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/21/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class LaunchView: UIView {
    
    
    public lazy var launchImage: UIImageView = {
        let launchImg = UIImageView()
        launchImg.image = UIImage(named: "SmallLogo")
        launchImg.contentMode = .scaleAspectFit
        launchImg.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        launchImg.layer.borderWidth = 4
        return launchImg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setConstraints()
    }
    
    func setConstraints() {
        addSubview(launchImage)
        
        launchImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            launchImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35), launchImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),  launchImage.centerXAnchor.constraint(equalTo: self.centerXAnchor), launchImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
}
