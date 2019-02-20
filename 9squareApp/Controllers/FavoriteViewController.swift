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
    var favVenue = RestaurantDataManager.fetchFavoriteFromDocumentsDirectory(){
        didSet{
            DispatchQueue.main.async {
                self.favView.favTableView.reloadData()
                
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        self.favView.favTableView.delegate = self
    }
    
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favVenue.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faveSelection = favVenue[indexPath.row]
        let tvCell = favView.favTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        tvCell.textLabel?.text = faveSelection.restaurantName
        tvCell.detailTextLabel?.text = faveSelection.description
        tvCell.backgroundColor = #colorLiteral(red: 0.2644796371, green: 0.4001772404, blue: 0.9960227609, alpha: 1)
        
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "This is a header section"
    }
    
   
    
    
}
