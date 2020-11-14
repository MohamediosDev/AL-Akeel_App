//
//  NotificationCell.swift
//  Al Akeel
//
//  Created by Mohamed on 10/4/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var Titlelabal: UILabel!
    @IBOutlet weak var MassegeTxt: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurenotifyCell(Notify:notify) {
        
        Titlelabal.text = Notify.title
        MassegeTxt.text = Notify.message
        
        
    }
    
}
