//
//  HomeVC.swift
//  Al Akeel
//
//  Created by Mohamed on 9/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.


import UIKit
import Alamofire
import JGProgressHUD

class HomeVC: UIViewController {
    
    
    //MARK:- outlet
    @IBOutlet weak var latestcollection: UICollectionView!
    @IBOutlet weak var CatogryView: UICollectionView!
    //MARK: - properties
    let url = "https://student.valuxapps.com/api/products?category_id=0"
    let url2 = "https://student.valuxapps.com/api/categories"
    var proudctModel:ProudctModel?
    var CatogryModel :catogryModal?
    var getCatogryDetails : GetCatogryDetails?
    var cCatogry : CCatogry?
    
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CatogryView.delegate = self
        CatogryView.dataSource = self
        latestcollection.delegate = self
        latestcollection.dataSource = self
        registerNib()
        proudctlaod()
        getcatogry()
    }
    
    //MARK: - Actions
    @IBAction func NotifyBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "NotifctionVC") as? NotifctionVC
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func SearchBtn(_ sender: Any) {
        
        
    }
    
    //MARK: - Methods
    func registerNib(){
        
        CatogryView.register(UINib(nibName: "CatogoreesCell", bundle: nil),forCellWithReuseIdentifier: "CatogoreesCell")
        latestcollection.register(UINib(nibName: "LatestProudctSCell", bundle:nil),forCellWithReuseIdentifier: "LatestProudctSCell")
    }
    
    
    func proudctlaod() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar",
                                   "Content-Type": "application/json",
                                   "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url, parms: nil, headers: headers, method: .get) {[weak self] (proudctsGet:ProudctModel?,proudctsfail:ProudctModel?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                self.proudctModel = proudctsGet
                hud.dismiss()
                self.latestcollection.reloadData()
                
            }
        }
    }
    func getcatogry() {
        
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        ApiService.Shared.fetchData(url: url2, parms: nil, headers: nil, method: .get) {[weak self] (Getcatogry:catogryModal?, Failcatogry:catogryModal?, error) in
            guard let self = self else {return}
            if let error = error {
                hud.dismiss()
                self.AlertError(title: "Error", msg: error.localizedDescription)
            }
            else {
                hud.dismiss()
                self.CatogryModel = Getcatogry
                self.CatogryView.reloadData()
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
        if segue.identifier ==  "ToproudctDeatil" {
            
            if  let datailvc = segue.destination as? ProudctDetailVC {
                
                if let product = sender as? proudct{
                    datailvc.proudct = product
                }
            }
        }
        else if segue.identifier == "ToCatgoryDetail" {
            
            if let CatgoryDetail = segue.destination as?  CatogryDetailVC {
    
                if let id = sender as? Int {
                    
                    CatgoryDetail.idCatgory = id
                    
                }
            }
        }
    }
    
}
//MARK:- Some extension
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    //collection and table view
    
    
    //collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CatogryView {
            
            let Catogry = CatogryModel?.data?.data
            return Catogry?.count ?? 0
            
        }
        let proudct = proudctModel?.data?.data
        return proudct?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == CatogryView {
            
            let cell = CatogryView.dequeueReusableCell(withReuseIdentifier: "CatogoreesCell", for: indexPath) as! CatogoreesCell
            
            if let Catogryy = CatogryModel?.data?.data[indexPath.item] {
                
                cell.configureCellCatogry(catogry:Catogryy)
            }
            return cell
        }
            
        else {
            
            let cellb = latestcollection.dequeueReusableCell(withReuseIdentifier: "LatestProudctSCell", for: indexPath) as! LatestProudctSCell
            if let proudcts = proudctModel?.data?.data?[indexPath.item] {
                
                cellb.configurecellproudcts(proudct: proudcts)
            }
            return cellb
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == latestcollection {
            
            
            if  let proudcts = proudctModel?.data?.data?[indexPath.item] {
                
                performSegue(withIdentifier: "ToproudctDeatil", sender: proudcts)
            }
        }
        else if collectionView == CatogryView {
            
            if let CatgoryID = CatogryModel?.data?.data[indexPath.item].id {
                performSegue(withIdentifier: "ToCatgoryDetail", sender: CatgoryID)
            }
        }
    }
}
