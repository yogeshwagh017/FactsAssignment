//
//  UIView+Ext.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

extension UIView {

    func setConstraints(to superview: UIView) {
        let guide = superview.safeAreaLayoutGuide
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true

    }
}
