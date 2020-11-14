//
//  CartCell.swift
//  Al Akeel
//
//  Created by Mohamed on 10/11/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class CartCell: UICollectionViewCell {
    
    @IBOutlet weak var imgproudct: UIImageView!
    @IBOutlet weak var Nameproudct: UILabel!
    @IBOutlet weak var quntitylbl: UILabel!
    var count = 0
    var product:proudct?
    var Delecart:PostCartModel?
    var DeleteCart = "https://student.valuxapps.com/api/carts"
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    
   
    
    
    
    func configurecell(cart:CartItem) {
        
//        quntitylbl.text = "\(cart.quantity ?? 0)"
        Nameproudct.text = cart.product?.name
        if let imageurl = cart.product?.image {
        let url = URL(string: imageurl)
        let placHolder = UIImage(named: "place")
        imgproudct.kf.indicatorType = .activity
        imgproudct.kf.setImage(with: url, placeholder:placHolder )
        }
    }
}
