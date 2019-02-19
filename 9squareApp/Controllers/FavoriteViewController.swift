//
//  FavoriteViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var testArray = ["Hello", "this", "is", "a", "test"] 
    
   var favView = FavoriteView()
    var favVenue = [FaveRestaurant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        
        
       
        
    }
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faveSelection = testArray[indexPath.row]
        let tvCell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        tvCell.textLabel?.text = faveSelection
        //tvCell.detailTextLabel?.text = faveSelection
        return tvCell
    }
    
    
}
