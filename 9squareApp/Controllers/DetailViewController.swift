//
//  DetailViewController.swift
//  9squareApp
//
//  Created by Donkemezuo Raymond Tariladou on 2/14/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    private var venue: VenueStruct!
    private let venueTipPlaceHolder = "Add a note about this venue..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        detailView.venueName.text = venue.name
        detailView.venueDescription.text = "Address:\n" + venue.location.formattedAddress[0] + "\n" + venue.location.formattedAddress[1]
        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        detailView.venueTip.delegate = self
        addVenue()
        getVenueImage()
        setupKeyboardToolbar()
    }
    
    
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
    
    fileprivate func setupKeyboardToolbar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done
            , target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        detailView.venueTip.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    
    private func addVenue(){
        let tabBarButton =  UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addToCollection))
        navigationItem.rightBarButtonItem = tabBarButton
    }
    
    @objc private func addToCollection(){
        
    let alertController =  UIAlertController(title: "", message: "Please enter a category name", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Submit", style: .default) { (alert) in
            let savingDate = Date.getISOTimestamp()
            guard let collectionName = alertController.textFields?.first?.text, let venueTipText = self.detailView.venueTip.text else {return}
            if let imageData = self.detailView.venueImage.image {
                let favoritedVenueImage = imageData.jpegData(compressionQuality: 0.5)
                let venueToSave = FaveRestaurant.init(collectionName: collectionName, restaurantName: self.venue.name, favoritedAt: savingDate, imageData: favoritedVenueImage, tipOne: venueTipText, description: (self.venue.categories.first?.name)!, venue: self.venue.location.formattedAddress[0] + " " + self.venue.location.formattedAddress[1])
                let collectionToSave = CollectionsModel.init(collectionName: collectionName.lowercased())
                CollectionsDataManager.save(newCollection: collectionToSave)
                RestaurantDataManager.addRestaurant(newFavoriteRestaurant: venueToSave, collection: "\(collectionName).plist")
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
        self.venue = restuarant
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    

}

extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == venueTipPlaceHolder {
            textView.text = ""
        }
    }
}
