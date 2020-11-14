//
//  UserDefineVC.swift
//  Al Akeel
//
//  Created by Mohamed on 10/4/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class UserDefineVC: UIViewController {
    
    
    //MARK: - outlet
 
    @IBOutlet weak var userimge: UIImageView!
    @IBOutlet weak var NameTxt: UILabel!
    @IBOutlet weak var EmailTxt: UILabel!
    @IBOutlet weak var Phone: UILabel!
    
    
    //MARK: - Properties
    
    var profile:GetProfile?
    var url = "https://student.valuxapps.com/api/profile"
    private let refreshControl = UIRefreshControl()
    
    
    
    
    //MARK:- App life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userimge.layer.cornerRadius = userimge.frame.height / 2
        Getprofile()
        refreshControl.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
    }
    
    
    //MARK:- Actions
    
    
    
    //MARK:- Methods
    
    @objc private func refresheData(_ sender: Any) {

        Getprofile()
    }
    
    
    func Getprofile() {
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let headers:HTTPHeaders = ["lang": "ar", "Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url, parms: nil, headers: headers, method: .get) {[weak self] (getprofile:GetProfile?, Failprofile:GetProfile?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.profile = getprofile
                hud.dismiss()
                self.NameTxt.text = self.profile?.data?.name
                self.EmailTxt.text = self.profile?.data?.email
                self.Phone.text = self.profile?.data?.phone
                if let imageurl = self.profile?.data?.image {
                    let url = URL(string: imageurl)
                    let placHolder = UIImage(named: "place")
                    self.userimge.kf.indicatorType = .activity
                    self.userimge.kf.setImage(with: url, placeholder:placHolder )
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
