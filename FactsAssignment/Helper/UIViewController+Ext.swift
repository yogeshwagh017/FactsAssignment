//
//  UIViewController+Ext.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 11/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit
import MBProgressHUD
import Reachability

extension UIViewController {
    func showSpinner(withTitle title: String) {
        DispatchQueue.main.async {
            let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            indicator.label.text = title
            indicator.isUserInteractionEnabled = false
            indicator.show(animated: true)
        }
    }

    func hideSpinner() {
        DispatchQueue.main.async {
        MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

    func showErrorMessage(title: String, errorMessage: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        do {
            let rechability: Reachability = try Reachability()
            switch rechability.connection {
            case .unavailable:
                let errorMsg = "Please check your Internet connection."
                self.showErrorMessage(title: "Network Error", errorMessage: errorMsg)
                completion(false)
            case .wifi:
                completion(true)
            case .cellular:
                completion(true)
            default:
                completion(false)
            }
        } catch let err {
            showErrorMessage(title: "Error", errorMessage: err.localizedDescription)
            completion(false)
        }
    }
}
