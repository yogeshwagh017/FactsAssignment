//
//  FactsViewModel.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 11/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

class FactsViewModel {
    
    var factTitle = ""
    var factsArray:[Facts] = []
    var factsService = FactsService()
    
    init()
    {
        factTitle = ""
    }
    init(factsModel: FactsModel) {
        factTitle = factsModel.title
        factsArray = factsModel.rows
    }
    func getNumberOfFacts()-> Int{
        return factsArray.count
    }
    
    func getFacts(atIndex : Int) -> Facts{
        return factsArray[atIndex]
    }
    
    func getScreenTitle() -> String
    {
        return factTitle
    }
    
    func fetchFacts(completion:@escaping (Result<FactsModel,Error>) -> ())
    {
        factsService.getFacts(url: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") { (result) in
            switch result{
            case .success(let factsModel):
                if(factsModel.rows.count > 0)
                {
                    self.factsArray = factsModel.rows;
                    self.factTitle = factsModel.title
                    completion(result)
                }
            case .failure:
                completion(result)
            }
        }
    }
}
