//
//  FavouriteVc.swift
//  Al Akeel
//
//  Created by Mohamed on 10/9/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class FavouriteVc: UIViewController {
    
    //MARK:- outlet
    
    @IBOutlet weak var favCollection: UICollectionView!
    
    
    //MARK:- proprties
    let url = "https://student.valuxapps.com/api/favorites"
    var Favourite: GetFavouriteDetailGet?
    private let refreshControl = UIRefreshControl()
    
    
    //MARK:- App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favCollection.delegate = self
        favCollection.dataSource = self
        RegisterNIB()
        GetData()
        favCollection.refreshControl = refreshControl
        favCollection.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:255, green:140, blue:43, alpha:1.0)
        favCollection.isHidden = true
    }
    //MARK:- Methods
    @objc private func refresheData(_ sender: Any) {
        // Fetch Weather Data
        GetData()
    }
    
    
    func GetData() {
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url, parms: nil, headers: headers, method: .get) {[weak self] (Getfavourite:GetFavouriteDetailGet?,failfavourite:GetFavouriteDetailGet?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.Favourite = Getfavourite
                hud.dismiss()
                self.favCollection.reloadData()
                self.refreshControl.endRefreshing()
                self.favCollection.isHidden = false
            }
        }
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
    
    func RegisterNIB() {
        
        favCollection.register(UINib(nibName: "FavouriteCell", bundle: nil), forCellWithReuseIdentifier: "FavouriteCell")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "ToDeatial" {
            
            if  let datailvc = segue.destination as? ProudctDetailVC {
                
                if let product = sender as? DataFav{
                    datailvc.DataFav = product
                }
            }
        }
    }
}

//MARK:- Some extension

extension FavouriteVc : UICollectionViewDelegate {
    
    
    
    
}
extension FavouriteVc : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let favourite = Favourite?.data?.data
        return favourite?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = favCollection.dequeueReusableCell(withReuseIdentifier: "FavouriteCell", for: indexPath) as? FavouriteCell
        if let data = Favourite?.data?.data?[indexPath.item] {
            
            cell?.ConfigureCell(proudct: data)
            
            
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let data = Favourite?.data?.data?[indexPath.item] {
            
            performSegue(withIdentifier: "ToDeatial", sender: data)
        }
    }
}

