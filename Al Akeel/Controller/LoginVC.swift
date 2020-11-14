//
//  LoginVC.swift
//  Al Akeel
//
//  Created by Mohamed on 9/22/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import JGProgressHUD
import Alamofire

class LoginVC: UIViewController {
    
    
    
    let url = "https://student.valuxapps.com/api/login"
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PassTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LoginTaped(_ sender: Any) {
        
        if EmailTxt.text?.isEmpty == true {
            
            AlertError(title: "Error", msg: "please Enter Email")
        }
        else if PassTxt.text?.isEmpty == true {
            
            AlertError(title: "Error", msg: "please Enter pass word")
        }
        else {
            UserDefaults.standard.set(EmailTxt.text, forKey: "EMAIl_Token")
            loginTap()
        }
        
        
        
    }
    
    @IBAction func ForgetpassvcTap(_ sender: Any) {
        
        let vc = ForgetpassVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    
    
    //ErrorHandle
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
        
    }
    
    
    func loginTap() {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let parm = [
            "email": EmailTxt.text,
            "password":PassTxt.text
        ]
        let headers:HTTPHeaders = ["lang":"ar",
                                   "Content-Type": "application/json"]
        
        ApiService.Shared.fetchData(url: url, parms: parm as Parameters, headers: headers, method: .post) { (loginSucess:LoginModel?, loginError:LoginErrorModel?, error) in
            
            if let error = error {
                // internet offline
                print(error)
                self.AlertError(title: "Errror", msg: error.localizedDescription)
                hud.dismiss()
            }
            else if let loginError = loginError {
                // data wrong
                hud.dismiss()
                self.AlertError(title: "Error", msg: loginError.message ?? "" )
            }
            else {
                self.AlertError(title: "Sucess", msg: loginSucess?.message ?? "")
                if loginSucess?.status ?? false {
                    
                    let vc = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarVC
                    vc!.modalPresentationStyle = .fullScreen
                    self.present(vc!, animated: true, completion: nil)
                    
                }
                
                
            }
            
        }
    }
    
    
}




