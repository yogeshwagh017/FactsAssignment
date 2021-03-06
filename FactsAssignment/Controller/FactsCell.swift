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
    // Image, title and description
    var factsImage = UIImageView()
    var factsTitle = UILabel()
    var factsDescription = UILabel()
    // default init method
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
    // set Constraints to Image
    func setImageConstraints() {
        factsImage.translatesAutoresizingMaskIntoConstraints = false
        factsImage.contentMode = .scaleAspectFit
        // swiftlint:disable:next line_length
        factsImage.topAnchor.constraint(equalTo: factsTitle.bottomAnchor, constant: 5).isActive = true
        factsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        factsImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        // swiftlint:disable:next line_length
        factsImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
    }
    // set Constraints to title label
    func setTitleConstraints() {
        factsTitle.textColor = .black
        factsTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        factsTitle.translatesAutoresizingMaskIntoConstraints = false
        factsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        factsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        factsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        // swiftlint:disable:next line_length
        factsTitle.bottomAnchor.constraint(equalTo: factsImage.topAnchor, constant: -5).isActive = true
    }
    // set Constraints to description label
    func setDescriptionConstraints() {
        factsDescription.numberOfLines = 0
        factsDescription.textColor = .darkGray
        factsDescription.contentMode = .topLeft
        factsDescription.font = UIFont.systemFont(ofSize: 14, weight: .light)
        factsDescription.translatesAutoresizingMaskIntoConstraints = false
        // swiftlint:disable:next line_length
        factsDescription.leadingAnchor.constraint(equalTo: factsImage.trailingAnchor, constant: 5).isActive = true
        // swiftlint:disable:next line_length
        factsDescription.topAnchor.constraint(equalTo: factsTitle.bottomAnchor, constant: 5).isActive = true
        // swiftlint:disable:next line_length
        factsDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        // swiftlint:disable:next line_length
        factsDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
    }
    // set cell content
    func set(fact: Facts) {
        if let title = fact.title {
            factsTitle.text = title
        } else {
            factsTitle.text = ""
        }
        if let description = fact.description {
            factsDescription.text = description
        } else {
            factsDescription.text = ""
        }
        if let imageHref = fact.imageHref {
            let placeholder = UIImage(named: "placeholder")
            let image = URL(string: imageHref)
            // swiftlint:disable:next line_length
            factsImage.sd_setImage(with: image, placeholderImage: placeholder, options: .highPriority) { (_, _, _, _) in
            }
        } else {
            factsImage.image = UIImage(named: "placeholder")
        }
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}
