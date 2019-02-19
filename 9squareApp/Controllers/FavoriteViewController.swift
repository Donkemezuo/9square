//
//  FavoriteViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
   var testMatrix = [["Hello", "this", "is", "a", "test"]]
   var favView = FavoriteView()
    var favVenue = [FaveRestaurant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        //self.favView.favTableView.delegate = self
        
       
        
    }
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testMatrix.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faveSelection = favVenue[indexPath.row]
        let tvCell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        tvCell.textLabel?.text = faveSelection.restaurantName
        tvCell.detailTextLabel?.text = faveSelection.description
        return tvCell
    }
    
    
}
