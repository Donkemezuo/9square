//
//  SearchView.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class SearchView: UIView {
 

    let search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        searchBar.layer.cornerRadius = 10.0
        searchBar.placeholder = "Search"
        return searchBar
        
    }()
    
    let segmentedControl: UISegmentedControl = {
        var items = ["List","Map"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        return segmentedControl
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInt(){
        setConstrains()
    }
    
    
    func  setConstrains() {
        addSubview(search)
        addSubview(segmentedControl)
        search.translatesAutoresizingMaskIntoConstraints = false
        search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        search.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        search.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        //search.heightAnchor.constraint(equalTo: heightAnchor, constant: 20).isActive = true
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 10).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
}


