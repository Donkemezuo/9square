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
    
    let mainSearchView = MainView()
    private let locationManager = CLLocationManager()
    private var coordinateToSearch = CLLocationCoordinate2D(latitude: 40.626994, longitude: -74.009727)
    private var venues = [VenueStruct]()
    private var annotations = [MKAnnotation]()
    
    private var myCurrentRegion = MKCoordinateRegion() {
        didSet {
            getVenues(keyword: userDefaultsSearchTerm())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "9Square"
        view.addSubview(mainSearchView)
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Locate Me", style: .plain, target: self, action: #selector(LocateMeButtonPressed))
        mainSearchView.collectionView.delegate = self
        mainSearchView.collectionView.dataSource = self
        locationManager.delegate = self
        mainSearchView.search.delegate = self
        checkLocationServices()
    }
    
    fileprivate func getVenues(keyword: String) {
        SearchAPIClient.getVenue(latitude: myCurrentRegion.center.latitude.description, longitude: myCurrentRegion.center.longitude.description, category: keyword) { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                DispatchQueue.main.async {
                    self.addAnnotations()
                    self.mainSearchView.collectionView.reloadData()
                }
            }
        }
    }
    
    fileprivate func addAnnotations() {
        mainSearchView.mapView.removeAnnotations(annotations)
        annotations.removeAll()
        for venue in venues {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat ?? 0.0, longitude: venue.location.lng ?? 0.0)
            annotation.title = venue.name
            annotations.append(annotation)
        }
        mainSearchView.mapView.showAnnotations(annotations, animated: true)
    }
    
    private func userDefaultsSearchTerm() -> String {
        if let searchTermFromUserDefaults = UserDefaults.standard.object(forKey: UserDefaultsKey.searchTerm) as? String {
            return searchTermFromUserDefaults
        } else {
            return "sushi"
        }
    }
    
    @objc private func LocateMeButtonPressed() {
//        mainSearchView.mapView.showsUserLocation = true
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
        collectionViewcell.activityIndicator.startAnimating()
        collectionViewcell.nameLabel.text = venueToSet.name
        collectionViewcell.addressLabel.text = venueToSet.location.formattedAddress[0] + " \n" +  venueToSet.location.formattedAddress[1]
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
                DispatchQueue.main.async {
                    collectionViewcell.activityIndicator.stopAnimating()
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
//            guard let coordinateRegion = myCurrentRegion else {
//                print("region coord nil")
//                return
//            }
            coordinateToSearch = myCurrentRegion.center//mainSearchView.mapView.userLocation.coordinate
        }
        let currentRegion = MKCoordinateRegion(center: coordinateToSearch, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mainSearchView.mapView.setRegion(currentRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myCurrentRegion = MKCoordinateRegion()
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
        guard let searchText = searchBar.text else { return }
        getVenues(keyword: searchText)
        UserDefaults.standard.set(searchText, forKey: UserDefaultsKey.searchTerm)
    }
}
