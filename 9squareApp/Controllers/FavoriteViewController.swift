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
    private var collections = [CollectionsModel]() {
        didSet {
            favoriteVenues.removeAll()
            for collection in collections {
                favoriteVenues.append(RestaurantDataManager.fetchFavoriteFromDocumentsDirectory(collection: collection.collectionName))
            }
            favView.favTableView.reloadData()
        }
    }
    private var favoriteVenues: [[FaveRestaurant]] = []
    
    var detailVC: DetailViewController!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collections = CollectionsDataManager.fetchCollections()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Venues"
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        self.favView.favTableView.delegate = self
        collections = CollectionsDataManager.fetchCollections()
    }

    
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteVenues[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let faveSelection = favoriteVenues[indexPath.section][indexPath.row]
        guard let tvCell = favView.favTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell else {return UITableViewCell()}
        tvCell.favLabel.text = faveSelection.restaurantName
        tvCell.addressLabel.text = faveSelection.description
        return tvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = favoriteVenues[indexPath.section][indexPath.row]
        let destination = DetailViewController(favRestaurant: restaurant)
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collections.count
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return collections[section].collectionName
    }
    
   
    
    
}
