//
//  ViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MainViewController: UIViewController {
    
    
    let mainSearchView = SearchView()
    private let locationManager = CLLocationManager()
    private var coordinateToSearch = CLLocationCoordinate2D(latitude: 40.743147, longitude: -73.9419)
    private var venues = [VenueStruct]()
    private var searchResults = [VenueStruct]()
    private var isSearching = false
    
    fileprivate func getVenues(keyword: String) {
        SearchAPIClient.getVenue(latitude: coordinateToSearch.latitude.description, longitude: coordinateToSearch.longitude.description, category: keyword) { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                DispatchQueue.main.async {
                    self.mainSearchView.collectionView.reloadData()
                }
                self.addAnnotations()
            }
        }
    }
    
    fileprivate func addAnnotations() {
        let annotation = MKPointAnnotation()
        for venue in venues {
            if let lat = venue.location.lat, let lon = venue.location.lng {
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                annotation.title = venue.name
                mainSearchView.mapView.addAnnotation(annotation)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "9Square"
        view.addSubview(mainSearchView)
        getVenues(keyword: "thai")
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        mainSearchView.collectionView.delegate = self
        mainSearchView.collectionView.dataSource = self
        locationManager.delegate = self
        checkLocationServices()
        mainSearchView.search.delegate = self
    }
    
    func checkLocationServices(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mainSearchView.mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mainSearchView.mapView.showsUserLocation = true
        }
    }
}



extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewcell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        let venueToSet = venues[indexPath.row]
        collectionViewcell.nameLabel.text = venueToSet.name
        collectionViewcell.addressLabel.text = venueToSet.location.formattedAddress[0] + " " +  venueToSet.location.formattedAddress[1]
        ImageAPIClient.getImages(venueID: venueToSet.id) { (appError, imageLink) in
            if let appError = appError {
                print("imageClient - \(appError)")
            } else if let imageLink = imageLink {
                self.venues[indexPath.row].imageLink = imageLink
                if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: imageLink) {
                    DispatchQueue.main.async {
                        collectionViewcell.imageView.image = imageIsInCache
                    }
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: imageLink, completion: { (appError, image) in
                        if let appError = appError {
                            print("imageHelper error - \(appError)")
                        } else if let image = image {
                            collectionViewcell.imageView.image = image
                        }
                    })
                }
            }
        }
        return collectionViewcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        let destination = DetailViewController(restuarant: venue)
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    
    

}


extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            coordinateToSearch = mainSearchView.mapView.userLocation.coordinate
        }
        let myCurrentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mainSearchView.mapView.setRegion(myCurrentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var myCurrentRegion = MKCoordinateRegion()
        if let currentLocation = locations.last {
            myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        } else {
            myCurrentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 1000, longitudinalMeters: 1000)
        }
       mainSearchView.mapView.setRegion(myCurrentRegion, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = venues
        searchResults = venues.filter{ $0.name.lowercased().contains(searchText.lowercased()) } //TODO: implement search by address name
        //isSearching = true
    }
}
