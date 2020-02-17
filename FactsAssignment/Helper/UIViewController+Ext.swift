//
//  UIViewController+Ext.swift
//  FactsAssignment
//
//  Created by kushal choudhari on 11/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showSpinner(withTitle title:String){
        DispatchQueue.main.async {
            let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            Indicator.label.text = title
            Indicator.isUserInteractionEnabled = false
            Indicator.show(animated: true)
        }
    }
    
    func hideSpinner(){
        DispatchQueue.main.async {
        MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func showErrorMessage(title:String,errorMessage:String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkInternetConnection(completion:@escaping (Bool)->()) {
        do {
            let rechability = try Reachability()
            
            if(rechability.connection == .cellular || rechability.connection == .wifi)
            {
                completion(true)
            }
            else
            {
                self.showErrorMessage(title: "Network Error", errorMessage: "Please check your Internet connection.")
                               completion(false)
            }
            
           /* rechability.whenReachable = { _ in
                completion(true)
            }
            rechability.whenUnreachable = { _ in
                self.showErrorMessage(title: "Network Error", errorMessage: "Please check your Internet connection.")
                completion(false)
            }*/
        } catch let err {
            showErrorMessage(title: "Error", errorMessage: err.localizedDescription)
        }
    }
    
    
}
