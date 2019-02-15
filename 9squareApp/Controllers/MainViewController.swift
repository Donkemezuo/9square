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
    private var venues = [VenueStruct]() {
        didSet {
            DispatchQueue.main.async {
                self.mainSearchView.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func getVenues() {
        SearchAPIClient.getVenue(latitude: coordinateToSearch.latitude.description, longitude: coordinateToSearch.longitude.description, category: "sushi") { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                //dump(self.venues)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "9Square"
        view.addSubview(mainSearchView)
        getVenues()
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        mainSearchView.collectionView.delegate = self
        mainSearchView.collectionView.dataSource = self
        locationManager.delegate = self
        checkLocationServices()
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
        if let safeVenueToSet = venueToSet.categories.first {
            let imageURL = safeVenueToSet.icon.prefix + safeVenueToSet.icon.suffix
            ImageHelper.fetchImageFromNetwork(urlString: imageURL) { (appError, image) in
                if let appError = appError {
                    print("imageHelper - \(appError)")
                } else if let image = image {
                    collectionViewcell.imageView.image = image
                }
            }

        }
        return collectionViewcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        let destination = DetailViewController(restuarant: venue)
        destination.detailView.venueName.text = venue.name
        destination.detailView.descriptionView.text = venue.location.address
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
