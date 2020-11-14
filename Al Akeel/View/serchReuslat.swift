//
//  serchReuslat.swift
//  Al Akeel
//
//  Created by Mohamed on 10/8/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import  Kingfisher
class serchReuslat: UITableViewCell {
    
    @IBOutlet weak var proudctimg: UIImageView!
    @IBOutlet weak var namTxt: UILabel!
    @IBOutlet weak var IDTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(proudct:proudct) {
        
        namTxt.text = proudct.name
        if proudct.inCart == false {
            
            IDTxt.text = " غير متوفر"
            
        }
        else {
            IDTxt.text =  "متوفر"
            
        }
        
        
        if let imgurl = proudct.image {
            let url = URL(string: imgurl)
            let palceholder = UIImage(named: "place")
            proudctimg.kf.indicatorType = .activity
            proudctimg.kf.setImage(with: url, placeholder: palceholder)
            
        }
        
    }
    
    
}
