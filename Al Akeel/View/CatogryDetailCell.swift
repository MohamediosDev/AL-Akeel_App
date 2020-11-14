//
//  CatogryDetailCell.swift
//  Al Akeel
//
//  Created by Mohamed on 10/12/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Kingfisher

class CatogryDetailCell: UICollectionViewCell {

    @IBOutlet weak var imgproudct: UIImageView!
    @IBOutlet weak var nameproudct: UILabel!
    @IBOutlet weak var moneyTxt: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var pepoleTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func ConfigureCell(catogryDetail:CatogryData) {
        nameproudct.text = catogryDetail.name
        moneyTxt.text = "\(catogryDetail.oldPrice ?? 0)"
        pepoleTxt.text = "\(catogryDetail.discount ?? 0)"
        idText.text = "\(catogryDetail.id ?? 0 )"
        
        
        if let imgurl = catogryDetail.image {
            let url = URL(string: imgurl)
            let placHolder = UIImage(named: "place")
            imgproudct.kf.indicatorType = .activity
            imgproudct.kf.setImage(with: url, placeholder:placHolder )
        }
    }
}
