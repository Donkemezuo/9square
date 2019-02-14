//
//  SearchView.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit

class SearchView: UIView {
 

    public lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        searchBar.layer.cornerRadius = 10.0
        searchBar.placeholder = "Search"
        return searchBar
        
    }()
    
    public lazy var mapView: MKMapView = {
            let map = MKMapView()
                map.layer.cornerRadius = 5.0
                return map
    }()

    public lazy var collectionView: UICollectionView = {
        
            let cellLayout = UICollectionViewFlowLayout()
                cellLayout.scrollDirection = .horizontal
                cellLayout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        
                cellLayout.itemSize = CGSize.init(width: 300, height: 300)
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
                collectionView.backgroundColor = UIColor.gray
                collectionView.layer.cornerRadius = 5.0
        return collectionView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
        self.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInt(){
        setConstrains()
    }
    
    
    func  setConstrains() {
        addSubview(search)
        addSubview(mapView)
        addSubview(collectionView)
        search.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        search.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
       
        mapView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 5).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        mapView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true 
        
    }
    
}


