//
//  ShowAdress.swift
//  Al Akeel
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class ShowAdress: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var AdressTable: UITableView!
    
    
    //MARK:- Properties
    var Adressmodal:GetAdressModal?
    let ApigetAdress = "https://student.valuxapps.com/api/addresses"
    
    
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AdressTable.delegate = self
        AdressTable.dataSource = self
        GetAdress()
        AdressTable.isHidden = true
        
    }
    
    //MARK:- Actions
    @IBAction func DimissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Methods
    
    func GetAdress() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        
        ApiService.Shared.fetchData(url: ApigetAdress, parms: nil, headers: headers, method: .get) { (getadress:GetAdressModal?, failadress:GetAdressModal?, error) in
            
            if let error = error {
                
                self.AlertError(title: "Error contnection", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.Adressmodal = getadress
                hud.dismiss()
                self.AdressTable.reloadData()
                self.AdressTable.isHidden = false
                
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ToOrderVc" {
                   
                   if let adressid = segue.destination as?  OrederVC {
           
                       if let id = sender as? Int {
                           
                        adressid.idAdress = id
                           
                       }
                   }
               }
    }
    
    
    
}
extension ShowAdress:UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.2
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adress = Adressmodal?.data?.data
        return adress?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = AdressTable.dequeueReusableCell(withIdentifier: "AdressShowCell", for: indexPath) as! AdressShowCell
        
        if let adress = Adressmodal?.data?.data?[indexPath.row]{
            
            cell.configurecell(DataAdress: adress)
            
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let adress = Adressmodal?.data?.data?[indexPath.row].id{
            
            performSegue(withIdentifier: "ToOrderVc", sender: adress)
            
        }
    }
    
    
    
    
    
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
    
    
    
}
