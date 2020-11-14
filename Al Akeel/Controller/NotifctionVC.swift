//
//  NotifctionVC.swift
//  Al Akeel
//
//  Created by Mohamed on 10/4/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

class NotifctionVC: UIViewController {
    
    var arry = [String]()
    var notficition:NotifyModal?
    var notify: notify?
    var refreshcontroller = UIRefreshControl()
    var url = "https://student.valuxapps.com/api/notifications"
    @IBOutlet weak var notifcationTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifcationTable.delegate = self
        notifcationTable.dataSource = self
        registernib()
        getNotifiy()
        refreshcontroller.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        refreshcontroller.addTarget(self, action: #selector(refresheData(_:)), for: .valueChanged)
        notifcationTable.addSubview(refreshcontroller)
        notifcationTable.refreshControl = refreshcontroller
        notifcationTable.reloadData()
        notifcationTable.isHidden = true
        
    }
    @objc private func refresheData(_ sender: Any) {
        // Fetch Weather Data
        getNotifiy()
    }
    
    func registernib(){
        notifcationTable.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
    }
    
    func getNotifiy() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading..."
        hud.show(in: self.view)
        let headers:HTTPHeaders = ["lang": "ar",
                                   "Content-Type": "application/json",
                                   "Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        ApiService.Shared.fetchData(url: url, parms: nil, headers: headers, method: .get) { [weak self](getNotify:NotifyModal?, notgetNotify:NotifyModal?, error) in
            guard let self = self else {return}
            if let error = error {
                self.AlertError(title: "Error", msg: error.localizedDescription)
                hud.dismiss()
            }
            else {
                
                guard let getNotify = getNotify else { return }
                self.notficition = getNotify
                hud.dismiss()
                self.notifcationTable.reloadData()
                self.refreshcontroller.endRefreshing()
                self.notifcationTable.isHidden = false
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
extension  NotifctionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.3
    }
}
extension  NotifctionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let notify = notficition?.data?.data
        return notify?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = notifcationTable.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        
        if let notify = notficition?.data?.data?[indexPath.row] {
            cell.configurenotifyCell(Notify: notify)
        }
        return cell
    }
    
    
    
}
