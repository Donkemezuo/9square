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
        return image 
    }()
    
    public lazy var venueName: UILabel = {
        let venueName = UILabel()
        venueName.text = "Event Detail Label"
        venueName.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        venueName.textAlignment = .center
        venueName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return venueName
    }()
    
    public lazy var descriptionView: UITextView = {
        let textView = UITextView()
        textView.dataDetectorTypes = [.address, .phoneNumber]
        textView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
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
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        venueImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        addSubview(venueName)
        venueName.translatesAutoresizingMaskIntoConstraints = false
        venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor).isActive = true
        venueName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        venueName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }




}
