//
//  RegisterVC.swift
//  Al Akeel
//
//  Created by Mohamed on 9/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class RegisterVC: UIViewController {

    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignupTaped(_ sender: Any) {
        
        if EmailTxt.text?.isEmpty == true {
            
            AlertError(title: "Error", msg: "Please Enter Email")
        }
        
        else if NameText.text?.isEmpty == true {
            
            AlertError(title: "Error", msg: "Please Enter Name")
        }
        else if passText.text?.isEmpty == true {
            
           AlertError(title: "Error", msg: "Please Enter password")
        }
        else {
            
            UserDefaults.standard.set(EmailTxt.text, forKey: "EMAIL_SAVED")
            Register() 
        }
      
        
    }
    
    
    func Register() {
       
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let param = [
            "email": EmailTxt.text!,
            "password":passText.text!,
            "name":NameText.text!
        ]
        let headers:HTTPHeaders = ["Accept": "application/json"]
        
        ApiService.Shared.fetchData(url: ApiConstans.BaseUrl + ApiConstans.Register, parms: param, headers: headers, method: .post) { (registerSuccess:RegisterSuccessModel?, registerError:RegisterError?, error) in
            if let error = error {
                //offline
                print(error)
                hud.dismiss()
                self.AlertError(title: "Error", msg: error.localizedDescription)
            }
            else if let registerError = registerError  {
                //Data wrong
                hud.dismiss()
                self.AlertError(title: "Error", msg: registerError.errors ?? "")
               
            }
            else {
                if registerSuccess?.status ?? false {
                    
                let vc = self.storyboard?.instantiateViewController(identifier: "AdressVc") as? AdressVc
                vc?.modalPresentationStyle = .fullScreen
                self.present(vc!, animated: true, completion: nil)
                    
                }
            }
        }
    }
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
        
    }
}
