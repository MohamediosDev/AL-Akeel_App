//
//  CatogryDetailVC.swift
//  Al Akeel
//
//  Created by Mohamed on 10/12/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import JGProgressHUD
import Alamofire

class CatogryDetailVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var CatogryDetail: UICollectionView!
    
    //MARK: - properties
    var CatogryModal:GetCatogryDetails?
    var idCatgory : Int?
    var catgory : CatogryData?
    @IBOutlet weak var Catogoryname: UILabel!
    
    private let refreshControl = UIRefreshControl()
    
    
    
    
    
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CatogryDetail.delegate = self
        CatogryDetail.dataSource = self
        RegisterNib()
        GetCatogryDeatail()
        CatogryDetail.refreshControl = refreshControl
        CatogryDetail.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        CatogryDetail.isHidden = true
        
    }
    
    //MARK:- Actions
    
    
    
    
    
    
    
    //MARK:- Methods
    @objc private func refresheData(_ sender: Any) {
        // Fetch Weather Data
        GetCatogryDeatail()
        
    }
    func RegisterNib() {
        
        CatogryDetail.register(UINib(nibName: "CatogryDetailCell", bundle: nil), forCellWithReuseIdentifier: "CatogryDetailCell")
    }
    
    func GetCatogryDeatail() {
        
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        let url = "https://student.valuxapps.com/api/categories/\(idCatgory ?? 0)"
        
        ApiService.Shared.fetchData(url: url  ,  parms: nil, headers: headers, method: .get) { (getDeatail:GetCatogryDetails?, FailDeatail:GetCatogryDetails?, error) in
            
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.CatogryModal = getDeatail
                hud.dismiss()
                self.CatogryDetail.reloadData()
                self.refreshControl.endRefreshing()
                self.CatogryDetail.isHidden = false
                
                
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromCatogryToDeatail" {
                
            if let CatgoryDetail = segue.destination as?  ProudctDetailVC {
        
                    if let id = sender as? Int {
                        
                        CatgoryDetail.IDd = id
                        
                    }
                }
            }
    }
    
    
    
    
}

//MARK: - Extentions
extension CatogryDetailVC:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
extension CatogryDetailVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let catogry = CatogryModal?.data?.data
        return catogry?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CatogryDetail.dequeueReusableCell(withReuseIdentifier: "CatogryDetailCell", for: indexPath) as! CatogryDetailCell
        if let catogry = CatogryModal?.data?.data?[indexPath.item] {
            
            cell.ConfigureCell(catogryDetail: catogry)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let catogry = CatogryModal?.data?.data?[indexPath.item].id {
                 
         performSegue(withIdentifier: "FromCatogryToDeatail", sender: catogry)
    }
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
    
}
