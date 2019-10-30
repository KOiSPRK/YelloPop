//
//  BaseViewController.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/28/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit
import MBProgressHUD
import AZDialogView

class BaseViewController: UIViewController {

    var loading:MBProgressHUD?
    var alertController:UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    func configure() {
        // override in subclasses
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            if let loading = self.loading, loading.isHidden == false {
                loading.hide(animated: false)
            }
            self.loading = MBProgressHUD.showAdded(to: self.view, animated: true)
            self.loading!.contentColor = UIColor.black
            self.loading!.bezelView.color = .white
            self.loading!.mode = .indeterminate
        }
    }
    
    func hideLoading(){
        DispatchQueue.main.async {
            if let loading = self.loading {
                loading.hide(animated: true)
            }
        }
    }

    func showDialog(title:String, message:String) {
        DispatchQueue.main.async {
            let dialog = AZDialogViewController(title: title, message: message)
            dialog.titleColor = .black
            dialog.messageColor = .darkGray
            dialog.blurBackground = false
            dialog.dismissWithOutsideTouch = true
            dialog.show(in: self)
        }
    }
    
    func showError(title:String = "Error", error:String?) {
        DispatchQueue.main.async {
            let dialog = AZDialogViewController(title: title, message: error ?? "Unknown Error")
            dialog.titleColor = .black
            dialog.messageColor = .darkGray
            dialog.blurBackground = false
            dialog.dismissWithOutsideTouch = true
            dialog.addAction(AZDialogAction(title: "Ok") { (dialog) -> (Void) in
                dialog.dismiss()
            })
            dialog.show(in: self)
        }
    }

}
