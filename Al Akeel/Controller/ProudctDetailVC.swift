//
//  ProudctDetailVC.swift
//  Al Akeel
//
//  Created by Mohamed on 10/6/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SDWebImage
import JGProgressHUD

class ProudctDetailVC: UIViewController {
    
    //MARK:- properties
    let url = "https://student.valuxapps.com/api/banners"
    let url2 = "https://student.valuxapps.com/api/favorites"
    let url3 = "https://student.valuxapps.com/api/carts"
    var images = [String]()
    var proudct: proudct?
    var loginmodel:LoginModel?
    var getFav:GetFavouriteDetailPost?
    var bannner = [Bannerimage]()
    var Bannerr :BannerModel?
    var currentindex = 0
    var timer:Timer?
    var CartModel:PostCartModel?
    var DataFav:DataFav?
    var IDd : Int?
    var Catogry : CatogryData?
    //MARK:- Outlet
    @IBOutlet weak var pagecontroller: UIPageControl!
    @IBOutlet weak var peopletxt: UILabel!
    @IBOutlet weak var oldP: UILabel!
    @IBOutlet weak var priceproudct: UILabel!
    @IBOutlet weak var NameproudctTxt: UILabel!
    @IBOutlet weak var proudctDatilCollection: UICollectionView!
    @IBOutlet weak var BannerImage: UIImageView!
    @IBOutlet weak var FavouriteOutlet: UIButton!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proudctDatilCollection.delegate = self
        proudctDatilCollection.dataSource = self
        GetpassData()
        NetworkCall(Api: url)
        pagecontroller.numberOfPages = images.count
        startTimer()
        if proudct != nil {
            
            GetpassData()
        }
        else {
            
            GetFavData()
            FavouriteOutlet.isHidden = true
            
        }
        
    }
    //MARK: - Actions
    
    @IBAction func AddToCartBtn(_ sender: Any) {
        postcart()
        GetFavData()
    }
    @IBAction func FavouriteButton(_ sender: Any) {
        
        if FavouriteOutlet.tag == 0 {
            FavouriteOutlet.setImage(UIImage(named: "0"), for: .normal)
            FavouriteOutlet.tag = 1
            GetFavourite()
        }
        else {
            
            FavouriteOutlet.setImage(UIImage(named: "6"), for: .normal)
            FavouriteOutlet.tag = 0
            GetFavourite()
            
            
        }
    }
    
    
    //MARK: - Methods
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval:3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction(){
        let desiredScrollPosition = (currentindex < images.count - 1) ? currentindex + 1 : 0
        proudctDatilCollection.scrollToItem(at: IndexPath(item: desiredScrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    func GetpassData() {
        NameproudctTxt.text = proudct?.name
        peopletxt.text = "\(proudct?.id ?? 1)"
        priceproudct.text = "\(proudct?.price ?? 1)"
        oldP.text = "\(proudct?.oldPrice ?? 1)"
        
        if let images = proudct?.images {
            self.images = images
            self.proudctDatilCollection.reloadData()
        }
    }
    
    
    func GetFavData() {
        NameproudctTxt.text = DataFav?.product?.name
        peopletxt.text = "\(DataFav?.id ?? 1)"
        priceproudct.text = "\(DataFav?.product?.price ?? 1)"
        oldP.text = "\(DataFav?.product?.oldPrice ?? 1)"
    
        if let images = DataFav?.product?.image {
        self.images = [images]
        self.proudctDatilCollection.reloadData()
    }
    }
    func NetworkCall(Api:String){
        
        AF.request(Api, method: .get, parameters: nil).responseJSON{response in
            do {
                let pars = try JSONDecoder().decode(BannerModel.self, from: response.data!)
                let url = URL(string: pars.data[2].image   ?? "" )
                let placHolder = UIImage(named: "place")
                self.BannerImage.kf.indicatorType = .activity
                self.BannerImage.kf.setImage(with: url, placeholder:placHolder )
            }
            catch {
                print("Error with server")
            }
        }
    }
    
    func GetFavourite() {
        
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let param = [
            "product_id": "\(proudct?.id ?? 1)"
        ]
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json", "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url2, parms: param, headers: headers, method: .post) {[weak self] (Getfavourite:GetFavouriteDetailPost?,failfavourite:GetFavouriteDetailPost?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                self.AlertError(title: "تم", msg:Getfavourite?.message ?? "")
                self.getFav = Getfavourite
                hud.dismiss()
                self.proudctDatilCollection.reloadData()
            }
        }
    }
    
    func postcart() {
        
        let param = [
            "product_id": "\(proudct?.id ?? 1)"]
        
        let headers:HTTPHeaders = ["lang": "ar", "Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: url3, parms: param, headers: headers, method: .post) {[weak self] (postCart:PostCartModel?, failCart:PostCartModel?, error) in
            
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                
            }
            else {
                self.AlertError(title: "Success", msg: postCart?.message ?? "")
                self.CartModel = postCart
                self.proudctDatilCollection.reloadData()
            }
        }
    }
}

//MARK: - Some extension
extension ProudctDetailVC:UICollectionViewDelegate {
    
    
}
extension ProudctDetailVC:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = proudctDatilCollection.dequeueReusableCell(withReuseIdentifier: "proudctdatilsCell", for: indexPath)  as! proudctdatilsCell
        let datail = self.images[indexPath.item]
        cell.configurecellproudct(image: datail)
        return cell
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentindex = Int(scrollView.contentOffset.x / proudctDatilCollection.frame.size.width)
        pagecontroller.currentPage = currentindex
    }
    
    
}
