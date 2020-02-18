//
//  FactsModel.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

struct FactsModel: Decodable {
    let title: String
    let rows: [Facts]
}
