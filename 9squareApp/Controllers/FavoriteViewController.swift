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
    
    var detailVC: DetailViewController!


    override func viewDidLoad() {
        super.viewDidLoad()

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
        guard let tvCell = favView.favTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell else {return UITableViewCell()}
        tvCell.favLabel.text = faveSelection.restaurantName
        tvCell.addressLabel.text = faveSelection.description
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (tableView.cellForRow(at: indexPath) as? FavoriteTableViewCell) != nil else { return }
        _ = favVenue[indexPath.row]
        
        
    
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "This is a header section"
    }
    
   
    
    
}
