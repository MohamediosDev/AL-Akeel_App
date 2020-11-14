//
//  CartVC.swift
//  Al Akeel
//
//  Created by Mohamed on 10/11/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class CartVC: UIViewController {
    
    
    //MARK:- Outlet
    @IBOutlet weak var CartCollection: UICollectionView!
    
    
    
    //MARK:- Properties
    var index = 0
    private let refreshControl = UIRefreshControl()
    var CartModel:GetCart?
    var cartUrl = "https://student.valuxapps.com/api/carts"
    
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CartCollection.delegate = self
        CartCollection.dataSource = self
        GetCart()
        RegistrNib()
        CartCollection.refreshControl = refreshControl
        CartCollection.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        CartCollection.isHidden = true
    }
    
    
    
    //MARK:- Actions
    
    
    
    
    
    
    
    
    
    //MARK:- Methods
    
    @objc private func refresheData(_ sender: Any) {
        // Fetch Weather Data
        GetCart()
    }
    
    
    
    func GetCart() {
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let headers:HTTPHeaders = ["lang": "ar", "Content-Type": "application/json", "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        ApiService.Shared.fetchData(url: cartUrl, parms: nil, headers: headers, method: .get) { (ShowCart:GetCart?, NoCart:GetCart?, error) in
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.CartModel = ShowCart
                hud.dismiss()
                self.CartCollection.reloadData()
                self.refreshControl.endRefreshing()
                self.CartCollection.isHidden = false
            }
            
        }
    }
    func RegistrNib() {
        CartCollection.register(UINib(nibName: "CartCell", bundle: nil), forCellWithReuseIdentifier: "CartCell")
    }
}
//MARK:- Extention
extension CartVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
extension CartVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cart = CartModel?.data?.cartItems
        return cart?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CartCollection.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as! CartCell
        if let Cart = CartModel?.data?.cartItems?[indexPath.item] {
            
            cell.configurecell(cart: Cart)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "CartandOrderVc") as? CartandOrderVc
        
        vc?.id = CartModel?.data?.cartItems?[indexPath.item].id
        vc?.ProudctimageString =  CartModel?.data?.cartItems?[indexPath.item].product?.image
        vc?.modalPresentationStyle = .overCurrentContext
        vc?.modalTransitionStyle = .crossDissolve
        present(vc!, animated: true, completion: nil)
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
}
