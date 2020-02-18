//
//  FactsViewController.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 10/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//
import UIKit

class FactsViewController: UIViewController {
    var factsTableView = UITableView()
    var factsViewModel = FactsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        configureFactsTableview()
        checkInternetConnection { [weak self] (connection) in
            if connection {
                self?.showSpinner(withTitle: "Loading..")
                self?.factsViewModel.fetchFacts { [weak self] (result) in
                    self?.hideSpinner()
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            self?.factsTableView.reloadData()
                            self?.title = self?.factsViewModel.getScreenTitle()
                        }
                    case .failure(let error) :
                        DispatchQueue.main.async {
                            // swiftlint:disable:next line_length
                            self?.showErrorMessage(title: "Service Error", errorMessage: error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    // Configure tableview
    func configureFactsTableview() {
        view.addSubview(factsTableView)
        factsTableView.delegate = self
        factsTableView.dataSource = self
        factsTableView.estimatedRowHeight = 100
        factsTableView.refreshControl = UIRefreshControl()
        // swiftlint:disable:next line_length
        factsTableView.refreshControl?.addTarget(self, action: #selector(handleRefreshData), for: .valueChanged)
        factsTableView.rowHeight = UITableView.automaticDimension
        factsTableView.register(FactsCell.self, forCellReuseIdentifier: "FactsCell")
        factsTableView.setConstraints(to: view)
    }
    // Handle pull to refresh event
    @objc func handleRefreshData() {
        checkInternetConnection { [weak self] (connection) in
            if connection {
                self?.showSpinner(withTitle: "Loading..")
                self?.factsViewModel.fetchFacts { [weak self](result) in
                    self?.hideSpinner()
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            self?.factsTableView.reloadData()
                            self?.title = self?.factsViewModel.getScreenTitle()
                            self?.factsTableView.refreshControl?.endRefreshing()
                        }
                    case .failure(let error) :
                        DispatchQueue.main.async {
                            // swiftlint:disable:next line_length
                            self?.showErrorMessage(title: "Service Error", errorMessage: error.localizedDescription)
                            self?.factsTableView.refreshControl?.endRefreshing()
                        }
                    }
                }
            } else {
                self?.factsTableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsViewModel.getNumberOfFacts()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell") as! FactsCell
        // swiftlint:disable:previous force_cast
        let fact =  factsViewModel.getFacts(atIndex: indexPath.row)
        cell.set(fact: fact)
        return cell
    }
}
