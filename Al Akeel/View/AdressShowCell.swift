//
//  AdressShowCell.swift
//  Al Akeel
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class AdressShowCell: UITableViewCell {
    
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var cityText: UILabel!
    @IBOutlet weak var Regiontext: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configurecell(DataAdress:dataAdress) {
        
        nameTxt.text = DataAdress.name
        cityText.text = DataAdress.city
        Regiontext.text = DataAdress.region
    }
   

}
