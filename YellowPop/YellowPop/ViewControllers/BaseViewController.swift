//
//  BaseViewController.swift
//  YellowPop
//
//  Created by KOiSPRK on 10/28/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit
import MBProgressHUD

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

    @objc func dismissAlertController(){
        self.alertController?.dismiss(animated: true, completion: nil)
    }
    
    func showDialog(title:String, message:String) {
        DispatchQueue.main.async {
            let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
            let effectView = UIVisualEffectView(effect: blurEffect)
            effectView.alpha = 0.3
            effectView.frame = self.view.bounds

            self.alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            self.view.addSubview(effectView)
            self.present(self.alertController!, animated: true, completion: nil)
            
//            self.present(self.alertController!, animated: true, completion: {() -> Void in
//               self.alertController?.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController)))
//           })
        }
    }

}
