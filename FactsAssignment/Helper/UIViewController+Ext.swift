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
        let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        Indicator.label.text = title
        Indicator.isUserInteractionEnabled = false
        Indicator.show(animated: true)
    }
    
    func hideSpinner(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
