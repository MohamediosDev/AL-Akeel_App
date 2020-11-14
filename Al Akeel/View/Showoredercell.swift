//
//  Showoredercell.swift
//  Al Akeel
//
//  Created by Mohamed on 11/10/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class Showoredercell: UITableViewCell {
    
    
    //MARK:- Outlet
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var StutasLabel: UILabel!
    
    @IBOutlet weak var Backview: UIView!
    
    
    //MARK:- Properties
    
    
    
    
    

    //MARK:- App Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Backview.layer.cornerRadius = 20
        Backview.clipsToBounds = true
    }
    
    
    
    
    //MARK:- Actions
    
    
    
    
    

    //MARK:- Methods
    
    func ConfiguerCellOrder(order:orderDetail) {
        
        TotalLabel.text = "\(order.total?.rounded() ?? 0)"
        DateLabel.text = order.date
        StutasLabel.text = order.status
        
        
    }

   
}
