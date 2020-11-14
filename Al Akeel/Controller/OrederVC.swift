//
//  OrederVC.swift
//  Al Akeel
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class OrederVC: UIViewController {
    
    //MARK:- Outlet
    
    @IBOutlet weak var paymentmethod: UISegmentedControl!
    @IBOutlet weak var paymentmethoddd: UILabel!
    @IBOutlet weak var CostTxt: UILabel!
    @IBOutlet weak var Disscountlable: UILabel!
    @IBOutlet weak var Totallabel: UILabel!
    
    
    
    //MARK:- Properties
    var idAdress:Int?
    let ApiOrder = "https://student.valuxapps.com/api/orders"
    var orderModel:OrdeModel?
    
    
    
    //MARK:- AppLifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hideen()
        paymentmethod?.setTitle("نقدا", forSegmentAt: 0)
        paymentmethod?.setTitle("اونلاين", forSegmentAt: 1)
        
    }
    
    
    
    //MARK:- Actions
    
  
    @IBAction func AddOrderBtn(_ sender: Any) {
        
        Addorder()
    }
    
    @IBAction func DismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func GoToOrderButton(_ sender: Any) {
        
        let vcgo = storyboard?.instantiateViewController(withIdentifier: "ShowOrdersVC") as? ShowOrdersVC
        vcgo?.modalPresentationStyle = .fullScreen
        present(vcgo!, animated: true, completion: nil)
    }
    
    //MARK:- Methods
    func Hideen() {
        
        paymentmethoddd.isHidden = true
        CostTxt.isHidden = true
        Disscountlable.isHidden = true
        Totallabel.isHidden = true
    }
    func showw() {
        
        paymentmethoddd.isHidden = false
        CostTxt.isHidden = false
        Disscountlable.isHidden = false
        Totallabel.isHidden = false
    }
    
    
    
    func Addorder() {
        
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar", "Content-Type": "application/json", "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        
        let param = [
            "address_id": idAdress!,
            "payment_method": 1,
            "use_points":false,
            "promo_code_id": 8
            
        ] as [String : Any]
        
        ApiService.Shared.fetchData(url: ApiOrder, parms: param, headers: headers, method: .post) {[weak self] (Getorder:OrdeModel?, failorder:OrdeModel?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.orderModel = Getorder
                hud.dismiss()
                self.paymentmethoddd.text = Getorder?.data?.paymentMethod
                self.CostTxt.text = "\(Getorder?.data?.cost ?? 10)"
                self.Disscountlable.text = "\(Getorder?.data?.discount ?? 0)"
                self.Totallabel.text = "\(Getorder?.data?.total?.rounded() ?? 0)"
                self.AlertError(title: "sucess", msg: Getorder?.message ?? "")
                self.showw()
                
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
//extension Double {
//    func removeZerosFromEnd() -> String {
//        let formatter = NumberFormatter()
//        let number = NSNumber(value: self)
//        formatter.minimumFractionDigits = 0
//        formatter.maximumFractionDigits = 4 //maximum digits in Double after dot (maximum precision)
//        return String(formatter.string(from: number) ?? "")
//    }
//}
