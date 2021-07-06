//
//  ViewController.swift
//  TwitterIntegrationDemo
//
//  Created by Macbook on 06/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FHSTwitterEngine.shared()?.permanentlySetConsumerKey("Consumer Key from tda", andSecret: "Secretekey from your twitter developer account")
        
        
        
    }


    @IBAction func logInBtnPressed(_ sender: UIButton) {
        let login = (FHSTwitterEngine.shared()?.loginController(completionHandler: { (sucess) in
            self.logInBtn.isHidden = true
            self.logOutBtn.isHidden = false
        }))! as UIViewController
        self.present(login, animated: true, completion: nil)
    }
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        FHSTwitterEngine.shared()?.clearAccessToken()
        self.logInBtn.isHidden = false
        self.logOutBtn.isHidden = true
    }
}

