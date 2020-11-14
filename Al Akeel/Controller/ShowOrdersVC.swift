//
//  ShowOrdersVC.swift
//  Al Akeel
//
//  Created by Mohamed on 11/10/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import JGProgressHUD
import Alamofire

class ShowOrdersVC: UIViewController {
    
    
    //MARK:- Outlet
    
    
    @IBOutlet weak var TableOrder: UITableView!
    
    //MARK:- Properties
    var showOrderss:GetOrderModel?
    let orderApi = "https://student.valuxapps.com/api/orders"
    private let refreshControl = UIRefreshControl()
    
    
    
    //MARK:- Applife cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableOrder.delegate = self
        TableOrder.dataSource = self
        registerViewNib()
        TableOrder.refreshControl = refreshControl
        TableOrder.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.gray
        TableOrder.separatorStyle = .none
        TableOrder.showsVerticalScrollIndicator = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TableOrder.reloadData()
    }
    
    //MARK:- Action
    
    @IBAction func BackBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK:- Methods
    @objc private func refresheData(_ sender: Any) {
        // Fetch Weather Data
        GetOrderr()
        
    }
    
    func registerViewNib() {
        TableOrder.register(UINib(nibName: "Showoredercell", bundle: nil), forCellReuseIdentifier: "Showoredercell")
    }
    func GetOrderr() {
        
        let hud = JGProgressHUD(style: .extraLight)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        
        let headers:HTTPHeaders = ["lang": "ar", "Content-Type": "application/json", "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
        ApiService.Shared.fetchData(url: orderApi, parms: nil, headers: headers, method:.get) { [weak self](getoreder:GetOrderModel?, failoreder:GetOrderModel?, error) in
            
            guard let self = self else {return}
            
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                self.showOrderss = getoreder
                hud.dismiss()
                self.TableOrder.reloadData()
                self.refreshControl.endRefreshing()
                
                
                
            }
        }
        
        
        
        
        
    }
    
    
    
    
}
extension ShowOrdersVC:UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.3

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let order = showOrderss?.data?.data
        return order?.count ?? 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
   let headerView = UIView()
   headerView.backgroundColor = UIColor.clear

   return headerView
   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableOrder.dequeueReusableCell(withIdentifier: "Showoredercell", for: indexPath) as! Showoredercell
        if let order = showOrderss?.data?.data?[indexPath.item] {
            
            cell.ConfiguerCellOrder(order: order)
        }
        return cell
    }
    
    func AlertError(title:String , msg:String) {
        
        let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
