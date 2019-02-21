//
//  DetailViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/14/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()

    private var venue: VenueStruct!
    var tabBarButton = UIBarButtonItem()

    
    fileprivate func getVenueImage() {
        if let linkExists = venue.imageLink {
            if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: linkExists) {
                detailView.venueImage.image = imageIsInCache
                detailView.activityIndicator.stopAnimating()
            } else {
                ImageHelper.fetchImageFromNetwork(urlString: linkExists) { (appError, image) in
                    if let appError = appError {
                        print("imageHelper in detail vc error = \(appError)")
                    } else if let image = image {
                        self.detailView.venueImage.image = image
                        self.detailView.activityIndicator.stopAnimating()
                        print("Detail VC made network call for image")
                    }
                }
            }
        } else {//get the link
            ImageAPIClient.getImages(venueID: venue.id) { (appError, link) in
                if let appError = appError {
                    print("detailVC imageAPIClient error = \(appError)")
                } else if let link = link {
                    if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: link) {
                        self.detailView.venueImage.image = imageIsInCache
                        self.detailView.activityIndicator.stopAnimating()
                    } else {
                        ImageHelper.fetchImageFromNetwork(urlString: link) { (appError, image) in
                            if let appError = appError {
                                print("imageHelper in detail vc error = \(appError)")
                            } else if let image = image {
                                self.detailView.venueImage.image = image
                                self.detailView.activityIndicator.stopAnimating()
                                print("Detail VC made network call for image bc link wasn't available")
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)

        detailView.venueName.text = venue.name
        detailView.venueDescription.text = "Address:\n" + venue.location.formattedAddress[0] + "\n" + venue.location.formattedAddress[1]
        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        

        addVenue()
        getVenueImage()
    }
    
    
    private func addVenue(){
        tabBarButton =  UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addToCollection))
        navigationItem.rightBarButtonItem = tabBarButton
    }
    
    @objc private func addToCollection(){
        
    let alertController =  UIAlertController(title: "", message: "Please enter a category name you want to save this venue", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Submit", style: .default) { (alert) in
            //this is when they press submit
            let savingDate = Date.getISOTimestamp()
            guard let collectionName = alertController.textFields?.first?.text else {return}
            if let imageData = self.detailView.venueImage.image {
                let favoritedVenueImage = imageData.jpegData(compressionQuality: 0.5)
                let venueToSave = FaveRestaurant.init(collectionName: collectionName, restaurantName: self.venue.name, favoritedAt: savingDate, imageData: favoritedVenueImage, tipOne: nil, description: (self.venue.categories.first?.name)!, venue: self.venue.location.formattedAddress[0] + " " + self.venue.location.formattedAddress[1])
                if  RestaurantDataManager.saveToDocumentDirectory(newFavoriteRestaurant: venueToSave).success {
                    self.showAlert(title: "Success", message: "Successfully saved venue to \(collectionName)")
                } else {
                    print("venue not successfully saved")
                }
            }
            
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (alert) in
            
        })
        

        alertController.addTextField {(textfield) in
            textfield.placeholder = "Enter collection name"
            textfield.textAlignment =  .center
            
        }
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
        
    }
    
    
    
    init(restuarant: VenueStruct){
        super.init(nibName: nil, bundle: nil)
        self.venue = restuarant
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    

}
