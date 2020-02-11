//
//  FactsService.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

class FactsService {
    func getFacts(url:String,completion:@escaping (Result<FactsModel,Error>) -> ()){
          // let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
           
           let url = URL(string: url)
         
           URLSession.shared.dataTask(with: url!){(data, response, err) in
               if let err = err {
                   completion(.failure(err))
                   return
               }
               
               if let d = data {
                   if let value = String(data: d, encoding: String.Encoding.ascii) {

                       if let jsonData = value.data(using: String.Encoding.utf8) {
                           do {
                               let facts = try JSONDecoder().decode(FactsModel.self, from: jsonData)
                               completion(.success(facts))
                           } catch let jsonError{
                               completion(.failure(jsonError))
                           }
                       }
                   }

               }

           }.resume()
       }
}
