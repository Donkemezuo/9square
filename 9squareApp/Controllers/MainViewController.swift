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
    
     let dummyArray = ["Yap","Kev","DM","Micheal","Greg","KK","Uber","Late","Wild","After","BB","Cutie","Company","Lord","We","Wining","Get","Help","When","You","Can","Else","You","Will","Die","Yes","I","Said","It","Kill","Mo","eee","rrr","yyy","rrr","qqq","uuu","ooo","mmm","sss","zzz","nnn","lll","iii"]
    
    let mainSearchView = SearchView()
    private let locationManager = CLLocationManager()
    private var coordinateToSearch = CLLocationCoordinate2D(latitude: 40.743147, longitude: -73.9419)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainSearchView)
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

<<<<<<< HEAD
=======
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewcell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()}
        let restuarant = dummyArray[indexPath.row]
        collectionViewcell.nameLabel.text = restuarant
        return collectionViewcell
    }
    
    
>>>>>>> 1544e4522850e98c2501532deb923ef4ea860659
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
