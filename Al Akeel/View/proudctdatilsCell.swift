//
//  proudctdatilsCell.swift
//  Al Akeel
//
//  Created by Mohamed on 10/6/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class proudctdatilsCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageview: UIImageView!
    
    func configurecellproudct(image:String) {
        
        let url = URL(string:image)
        let placHolder = UIImage(named: "place")
        imageview.kf.indicatorType = .activity
        imageview.kf.setImage(with: url, placeholder:placHolder )
        
        
    }
    
}
