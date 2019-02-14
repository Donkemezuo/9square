//
//  MapView.swift
//  9squareApp
//
//  Created by Jane Zhu on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit

class VenueMapView: UIView {

    public lazy var map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        commonIt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonIt() {
        setupMap()
    }

}

extension VenueMapView {
    private func setupMap() {
        addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        [map.topAnchor.constraint(equalTo: topAnchor, constant: 0),
         map.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
         map.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
         map.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ].forEach{ $0.isActive = true }
    }
}
