//
//  SearchDetailView.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .gray
        ai.hidesWhenStopped = true
        return ai
    }()
    
    public lazy var venueImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background_1"))
        image.contentMode = .scaleToFill
            image.layer.cornerRadius = 10.0
        return image 
    }()
    
    public lazy var venueName: UILabel = {
        let venueName = UILabel()
        venueName.text = "Event Detail Label"
        venueName.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        venueName.textAlignment = .center
        venueName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        venueName.font = UIFont(name: "Copperplate-Bold", size: 24)
        venueName.layer.cornerRadius = 5.0
        return venueName
    }()
    
    public lazy var venueDescription: UITextView = {
        let textView = UITextView()
        textView.dataDetectorTypes = [.address, .phoneNumber]
        textView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        textView.textAlignment = .center
        venueName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Copperplate-Bold", size: 20)
        textView.isEditable = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        SetConstrains()
}
    
    func SetConstrains(){
        addSubview(venueImage)
        addSubview(venueName)
        addSubview(venueDescription)
        addSubview(activityIndicator)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueName.translatesAutoresizingMaskIntoConstraints = false
        venueDescription.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -400).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
      
        venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 5).isActive = true
        venueName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        venueName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        venueName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        venueDescription.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 5).isActive = true
        venueDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        venueDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        venueDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: venueImage.centerYAnchor, constant: 0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: venueImage.centerXAnchor, constant: 0).isActive = true
    }
    
    




}
