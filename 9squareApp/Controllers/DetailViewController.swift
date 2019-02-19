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
    private var restuarant: VenueStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        view.backgroundColor = .red
        detailView.venueName.text = restuarant.name
        detailView.venueDescription.text = restuarant.location.modifiedAddress

        
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
    
    init(restuarant: VenueStruct){
        super.init(nibName: nil, bundle: nil)
        self.restuarant = restuarant
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    

}
