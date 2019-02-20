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

    private var restuarant:VenueStruct!
    var tabBarButton = UIBarButtonItem()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)

       
        detailView.venueName.text = restuarant.name
        detailView.venueDescription.text = restuarant.location.formattedAddress[0] + "\n" + restuarant.location.formattedAddress[1]

        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        

            addVenue()
        if let linkExists = restuarant.imageLink {
            if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: linkExists) {
                detailView.venueImage.image = imageIsInCache
            } else {
                ImageHelper.fetchImageFromNetwork(urlString: linkExists) { (appError, image) in
                    if let appError = appError {
                        print("imageHelper in detail vc error = \(appError)")
                    } else if let image = image {
                        self.detailView.venueImage.image = image

                        
                    }
                }
            }
        }
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
                let venueToSave = FaveRestaurant.init(collectionName: collectionName, restaurantName: self.restuarant.name, favoritedAt: savingDate, imageData: favoritedVenueImage, description: (self.restuarant.categories.first?.name)!, venue: self.restuarant.location.modifiedAddress)
                
    RestaurantDataManager.saveToDocumentDirectory(newFavoriteRestaurant: venueToSave)
                
         self.showAlert(title: "Success", message: "Successfully saved venue to \(collectionName)")

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
        self.restuarant = restuarant
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    

}
