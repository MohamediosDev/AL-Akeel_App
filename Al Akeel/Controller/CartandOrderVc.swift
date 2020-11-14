//
//  CartandOrderVc.swift
//  Al Akeel
//
//  Created by Mohamed on 10/13/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class CartandOrderVc: UIViewController {
    
    
    //MARK: - outlet
    @IBOutlet weak var qountlable: UILabel!
    @IBOutlet weak var ProudctImg: UIImageView!
    @IBOutlet weak var BackView: UIView!
    
    
    
    
    //MARK: - properties
    var count = 0
    var Cartcount :CartItem?
    var postcart: PostCartModel?
    var Editquntity:EdiitQuntityCart?
    var prudct: proudct?
    var editcart:Cart?
    var CartItem:CartItem?
    var id : Int?
    var delete:DeleteCart?
    var ProudctimageString: String?
  
    
    //MARK: - App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let imgurl = ProudctimageString!
        let url = URL(string: imgurl)
        let placHolder = UIImage(named: "place")
        ProudctImg.kf.indicatorType = .activity
        ProudctImg.kf.setImage(with: url, placeholder:placHolder )
        BackView.layer.cornerRadius = 14
        BackView.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ClosePopUp))
        view.addGestureRecognizer(tap)
        
    }
    
    // Third always implemented
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BackView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.BackView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
    }
     // Third always implemented
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         BackView.alpha = 1
        UIView.animate(withDuration: 0.2) {
            self.BackView.transform = .identity
        }
    }
    //MARK: - actions
    
    
    @IBAction func Dissmiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        count = count + 1
        qountlable.text = "\(count)"
    }
    
    @IBAction func MinusBtn(_ sender: Any) {
        count = count - 1
        qountlable.text = "\(count)"
    }
    
    
    @IBAction func Test(_ sender: Any) {
        editQuntity()
    }
    
    
    @IBAction func RemoveFromCart(_ sender: Any) {
       DeleteCart()
    }
    
    //MARK:- Methos
    
    @objc func ClosePopUp(){
        dismiss(animated: true, completion: nil)
    }
   
    func editQuntity() {
        
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        let param = ["quantity": Int(qountlable.text!)]
        let urledit = "https://student.valuxapps.com/api/carts/\(id ?? 0)"
        ApiService.Shared.fetchData(url: urledit , parms: param as Parameters, headers: headers, method: .put) {[weak self] (getEdit:EdiitQuntityCart?, failEdit:EdiitQuntityCart?, error) in
             guard let self = self else {return}
            if let error = error {
                
                print(error.localizedDescription)
            }
            else {
                
                self.Editquntity = getEdit
                let vc = self.storyboard?.instantiateViewController(identifier: "ShowAdress") as? ShowAdress
                vc?.modalPresentationStyle = .fullScreen
                self.present(vc!, animated: true, completion: nil)
            }
        }
    }
    
    func DeleteCart() {
        
         let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        let Deleturl = "https://student.valuxapps.com/api/carts/\(id ?? 0)"
        
        ApiService.Shared.fetchData(url: Deleturl, parms: nil, headers: headers, method: .delete) {[weak self] (Delete:DeleteCart?, fail:DeleteCart?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                
            }
            else {
                
                self.delete = Delete
                self.AlertError(title: "Sucess", msg: Delete?.message ?? "")
                
                
                
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

