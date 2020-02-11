//
//  FactsCell.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit
import SDWebImage

class FactsCell: UITableViewCell {
    
    var factsImage = UIImageView()
    var factsTitle = UILabel()
    var factsDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factsImage)
        addSubview(factsTitle)
        addSubview(factsDescription)
        setTitleConstraints()
        setDescriptionConstraints()
        setImageConstraints()
        factsImage.layer.cornerRadius = 10
        factsImage.clipsToBounds = true
    }
    
    func setImageConstraints()
    {
        factsImage.translatesAutoresizingMaskIntoConstraints = false
        factsImage.contentMode = .scaleAspectFit
        factsImage.topAnchor.constraint(equalTo: factsTitle.bottomAnchor, constant: 5).isActive = true
        factsImage.leadingAnchor.constraint(equalTo:leadingAnchor , constant: 5).isActive = true
        factsImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        factsImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        factsImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func setTitleConstraints()
    {
        factsTitle.textColor = .black
        factsTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        factsTitle.translatesAutoresizingMaskIntoConstraints = false
        factsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        factsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        factsTitle.bottomAnchor.constraint(equalTo: factsImage.topAnchor, constant: -5).isActive = true
    }
    
    func setDescriptionConstraints()
    {
        factsDescription.numberOfLines = 0
        factsDescription.textColor = .darkGray
        factsDescription.contentMode = .topLeft
        factsDescription.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        factsDescription.translatesAutoresizingMaskIntoConstraints = false
        factsDescription.leadingAnchor.constraint(equalTo:factsImage.trailingAnchor , constant: 5).isActive = true
        factsDescription.topAnchor.constraint(equalTo: factsTitle.bottomAnchor, constant: 5).isActive = true
        factsDescription.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -5).isActive = true
        factsDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func set(fact:Facts)
    {
        if let title = fact.title {
            factsTitle.text = title
        }
        else{
            factsTitle.text = ""
        }
        
        if let description = fact.description {
            factsDescription.text = description
        }
        else{
            factsDescription.text = ""
        }
        
        if let imageHref = fact.imageHref {
            factsImage.sd_setImage(with: URL(string: imageHref) , placeholderImage: UIImage(named: "placeholder"), options: .highPriority) { (_, _, _, _) in
                
            }
        }
        else
        {
            factsImage.image = UIImage(named: "placeholder")
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
}
