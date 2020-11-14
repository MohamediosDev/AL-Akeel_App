//
//  SerchBarVc.swift
//  Al Akeel
//
//  Created by Mohamed on 10/8/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import JGProgressHUD
import Alamofire


class SerchBarVc: UIViewController {
    
    let url = "https://student.valuxapps.com/api/products/search"
    
    
    var proudctModel:ProudctModel?
    
    
    @IBOutlet weak var SearchTxt: UITextField!
    @IBOutlet weak var SerchTable: UITableView!
    @IBOutlet weak var ImageAvatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        registernib ()
        SerchTable.delegate = self
        SerchTable.dataSource = self
        SerchTable.isHidden = true
        ImageAvatar.isHidden = true
        
        
    }
    
    
    @IBAction func BtnSearch(_ sender: Any) {
        if SearchTxt.text?.isEmpty == true {
            
            
            AlertError(title: "Error", msg: "You must write any thing")
        }
        else {
            
            proudctlaod()
            SerchTable.isHidden = false
        }
    }
    
    
    
    func registernib () {
        SerchTable.register(UINib(nibName: "serchReuslat", bundle: nil), forCellReuseIdentifier: "serchReuslat")
        
    }
    func proudctlaod() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let parm = [
            "text":SearchTxt.text
        ]
        let headers:HTTPHeaders = ["lang": "ar",
                                   "Content-Type": "application/json",
                                   "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url,parms: parm as Parameters, headers: headers, method: .post) {[weak self] (proudctsGet:ProudctModel?,proudctsfail:ProudctModel?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Erro", msg: error.localizedDescription)
                hud.dismiss()
            }
            else if proudctsGet?.data?.data?.count == 0 {
                self.SerchTable.isHidden = true
                self.ImageAvatar.isHidden = false
                hud.dismiss()
                
                
            }
                
            else {
                self.proudctModel = proudctsGet
                hud.dismiss()
                self.SerchTable.reloadData()
                self.ImageAvatar.isHidden = true
                
            }
        }
        
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "ToDetail" {
            
            if  let datailvc = segue.destination as? ProudctDetailVC {
                
                if let product = sender as? proudct{
                    datailvc.proudct = product
                }
            }
        }
    }
}
extension SerchBarVc : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.3
        
    }
    
    
}
extension SerchBarVc : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let proudct = proudctModel?.data?.data
        return proudct?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "serchReuslat", for: indexPath) as? serchReuslat else {
            return UITableViewCell()
        }
        if let proudct  = proudctModel?.data?.data?[indexPath.row] {
            
            cell.configureCell(proudct: proudct)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let proudct  = proudctModel?.data?.data?[indexPath.row] {
            
            performSegue(withIdentifier: "ToDetail", sender: proudct)
        }
        
    }
    
    
    
}
