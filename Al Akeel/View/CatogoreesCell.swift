//
//  CatogoreesCell.swift
//  Al Akeel
//
//  Created by Mohamed on 9/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class CatogoreesCell: UICollectionViewCell {

    @IBOutlet weak var imageCatogory: UIImageView!
    @IBOutlet weak var nameTXt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCatogory.layer.cornerRadius = 6
    }

    
    func configureCellCatogry(catogry:CCatogry)  {
        nameTXt.text = catogry.name
        if let imageUrl = catogry.image {
            
            let url = URL(string: imageUrl)
            let palceholder = UIImage(named: "place")
            imageCatogory.kf.indicatorType = .activity
            imageCatogory.kf.setImage(with: url, placeholder: palceholder)
            
            
        }
    
    
    }
    
}
