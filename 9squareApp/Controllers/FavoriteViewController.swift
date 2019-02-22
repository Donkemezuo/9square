//
//  FavoriteViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
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

    fileprivate func fetchCollections() {
        collections = CollectionsDataManager.fetchCollections()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchCollections()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Venues"
        view.addSubview(favView)
        self.favView.favTableView.dataSource = self
        self.favView.favTableView.delegate = self
        fetchCollections()
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
        tvCell.addressLabel.text = faveSelection.address
        if let imageData = faveSelection.imageData {
             tvCell.favImage.image = UIImage(data: imageData)
        }
        tvCell.venueTip.text = faveSelection.venueTip ?? ""
        return tvCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return collections[section].collectionName
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(favoriteVenues[indexPath.section][indexPath.row].restaurantName)
        RestaurantDataManager.deleteRestaurant(atIndex: indexPath.row, collection: favoriteVenues[indexPath.section][indexPath.row].collectionName)
        fetchCollections()
    }
    
    
}
