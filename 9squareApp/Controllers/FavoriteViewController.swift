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
    private var favView = FavoriteView()
    private var collections = CollectionsDataManager.fetchCollections()
//    private var favVenue = RestaurantDataManager.fetchFavoriteFromDocumentsDirectory(collection: "sushi"){
//        didSet{
//            DispatchQueue.main.async {
//                self.favView.favTableView.reloadData()
//
//            }
//        }
//
//    }
    private var favVenue = [[FaveRestaurant]]()
    
    var detailVC: DetailViewController!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        self.favView.favTableView.delegate = self
        print(collections)
        for collection in collections {
            favVenue.append(RestaurantDataManager.fetchFavoriteFromDocumentsDirectory(collection: collection.collectionName))
        }
    }
    
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favVenue[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faveSelection = favVenue[indexPath.section][indexPath.row]
        guard let tvCell = favView.favTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell else {return UITableViewCell()}
        tvCell.favLabel.text = faveSelection.restaurantName
        tvCell.addressLabel.text = faveSelection.description
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (tableView.cellForRow(at: indexPath) as? FavoriteTableViewCell) != nil else { return }
        _ = favVenue[indexPath.row]
        
        
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collections.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return collections[section].collectionName
    }
    
   
    
    
}
