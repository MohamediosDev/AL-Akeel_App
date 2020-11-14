//
//  LatestProudctSCell.swift
//  Al Akeel
//
//  Created by Mohamed on 9/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class LatestProudctSCell: UICollectionViewCell {

    @IBOutlet weak var Backview: UIView!
    @IBOutlet weak var MealImage: UIImageView!
    @IBOutlet weak var SortLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var Timelbl: UILabel!
    @IBOutlet weak var isUselbl: UILabel!
    @IBOutlet weak var numberOfpeopleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Backview.layer.cornerRadius = 2
        Backview.clipsToBounds = true
       
          }
    func configurecellproudcts(proudct:proudct) {
        nameLbl.text = proudct.name
        numberOfpeopleLabel.text = "\(proudct.id ?? 0)"
        Timelbl.text = "\(proudct.oldPrice ?? 0)"
        isUselbl.text = "\(proudct.discount ?? 0)"
        //need kingfisher
        if let imageurl = proudct.image {
            
            let url = URL(string: imageurl)
            let placHolder = UIImage(named: "place")
            MealImage.kf.indicatorType = .activity
            MealImage.kf.setImage(with: url, placeholder:placHolder )
            
            
        }
        
        
    }
   
    
}
