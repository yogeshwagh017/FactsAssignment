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
        setImageConstraints()
        setTitleConstraints()
        setDescriptionConstraints()
        factsImage.layer.cornerRadius = 10
        factsImage.clipsToBounds = true
    }
    
    func setImageConstraints()
    {
        factsImage.translatesAutoresizingMaskIntoConstraints = false
        
        factsImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    factsImage.leadingAnchor.constraint(equalTo:factsDescription.trailingAnchor , constant: 5).isActive = true
        factsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        factsImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func setTitleConstraints()
    {
        factsTitle.numberOfLines = 0
        factsTitle.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        factsTitle.translatesAutoresizingMaskIntoConstraints = false
        factsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        factsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        factsTitle.bottomAnchor.constraint(equalTo: factsDescription.topAnchor, constant: 5).isActive = true
    }
    
    func setDescriptionConstraints()
    {
        factsDescription.numberOfLines = 0
        factsTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        factsDescription.translatesAutoresizingMaskIntoConstraints = false
        factsDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsDescription.topAnchor.constraint(equalTo: factsTitle.bottomAnchor, constant: 5).isActive = true
        factsDescription.trailingAnchor.constraint(equalTo: factsImage.leadingAnchor , constant: -5).isActive = true
        factsDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }
    
    func set(fact:Facts)
    {
        if let imageHref = fact.imageHref {
            factsImage.sd_setImage(with: URL(string: imageHref) , placeholderImage: UIImage(named: "placeholder"), options: .highPriority) { (downloadedImage, downloadError, cacheType, downloadURL) in
                if let downloadException = downloadError {
                    print("Download error \( downloadException.localizedDescription)")
                }
                else
                {
                    print("Download sucess \(downloadURL?.absoluteString)")
                }
            }
       }
        
        if let title = fact.title {
            factsTitle.text = title
        }
        
        
        if let description = fact.description {
            factsDescription.text = description
        }
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

}
