//
//  SearchDetailView.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var venueImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background_1"))
            image.layer.cornerRadius = 10.0
        return image 
    }()
    
    public lazy var venueName: UILabel = {
        let venueName = UILabel()
        venueName.text = "Event Detail Label"
        venueName.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1).withAlphaComponent(0.5)
        venueName.textAlignment = .center
        venueName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        venueName.layer.cornerRadius = 5.0
        return venueName
    }()
    
    public lazy var venueDescription: UITextView = {
        let textView = UITextView()
        textView.dataDetectorTypes = [.address, .phoneNumber]
        textView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.4)
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 20)
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
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueName.translatesAutoresizingMaskIntoConstraints = false
        venueDescription.translatesAutoresizingMaskIntoConstraints = false
        
        venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -350).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
      
        venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 5).isActive = true
        venueName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        venueName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        venueDescription.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 5).isActive = true
        venueDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        venueDescription.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    




}
