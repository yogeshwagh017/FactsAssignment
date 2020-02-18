//
//  FactsService.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

class FactsService {
    func getFacts(url: String, completion: @escaping (Result<FactsModel, Error>) -> Void) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) {(data, _, err) in
            guard let error = err else {
                guard let serverData = data else {
                    return
                }
                guard let value = String(data: serverData, encoding: String.Encoding.ascii) else {
                    return
                }
                guard let jsonData = value.data(using: String.Encoding.utf8) else {
                    return
                }
                do {
                    let facts = try JSONDecoder().decode(FactsModel.self, from: jsonData)
                    completion(.success(facts))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
                return
            }
            completion(.failure(error))
        }.resume()
    }
}
