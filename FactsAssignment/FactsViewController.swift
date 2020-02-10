//
//  FactsViewController.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {

    let sampleDatasource = ["Objective c", "Swift", "Java" , "Kotlin"]
    
    var factsArray:[Facts] = []
    
    var factsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
       // factsTableView = UITableView(frame: self.view.bounds, style: .plain)
        getFacts { (result) in
            switch result{
            case .success(let factsModel):
                if(factsModel.rows.count > 0)
                {
                    self.factsArray = factsModel.rows;
                    DispatchQueue.main.async {
                        self.factsTableView.reloadData()
                        self.title = factsModel.title
                    }
                    
                }
                
            case .failure(let err):
                print("Error : \(err.localizedDescription)")
            }
        }
        configureFactsTableview()
    }
    
    func configureFactsTableview()
    {
        view.addSubview(factsTableView)
        factsTableView.delegate = self
        factsTableView.dataSource = self
        factsTableView.rowHeight = 200
        factsTableView.register(FactsCell.self, forCellReuseIdentifier: "FactsCell")
        factsTableView.setConstraints(to: view)
    }

}

extension FactsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return factsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell") as! FactsCell
        let fact = factsArray[indexPath.row]
        cell.set(fact: fact)
     
        return cell
    }
    
    
}

extension FactsViewController
{
    func getFacts(completion:@escaping (Result<FactsModel,Error>) -> ()){
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
        let url = URL(string: urlString)
      
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
