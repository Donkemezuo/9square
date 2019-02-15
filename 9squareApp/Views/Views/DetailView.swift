//
//  SearchDetailView.swift
//  9squareApp
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var detailImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background_1"))
        return image 
    }()
    
    public lazy var eventDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Event Detail Label"
        label.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    public lazy var descriptionView: UITextView = {
        let textView = UITextView()
        textView.dataDetectorTypes = [.address, .phoneNumber]
        textView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        return textView
    }()
    
    
    func setImage(){
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        detailImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }

    func setEventLabel () {
       addSubview(eventDetailLabel)
        eventDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        eventDetailLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor).isActive = true
        eventDetailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        eventDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setEventDescription(){
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        setImage()
        setEventLabel()
        setEventDescription()
    }

}
