//
//  FavouriteCell.swift
//  Al Akeel
//
//  Created by Mohamed on 10/9/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher


class FavouriteCell: UICollectionViewCell {
    
    
    @IBOutlet weak var prImage: UIImageView!
    @IBOutlet weak var Nameimg: UILabel!
    @IBOutlet weak var IdTxt: UILabel!
    var proudct : proudct?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func ConfigureCell(proudct:DataFav) {
        
        
        IdTxt.text = "\(proudct.id ?? 1)"
        Nameimg.text = proudct.product?.name
        if let imageurl = proudct.product?.image {
            
            let url = URL(string: imageurl)
            let placHolder = UIImage(named: "place")
            prImage.kf.indicatorType = .activity
            prImage.kf.setImage(with: url, placeholder:placHolder )           
}
}
}
