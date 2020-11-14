//
//  ForgetpassVC.swift
//  Al Akeel
//
//  Created by Mohamed on 9/23/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class ForgetpassVC: UIViewController {

    @IBOutlet weak var containerView: Viewcustom!
    @IBOutlet weak var emailTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(closepop))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        containerView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
    }
     // Third always implemented
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         containerView.alpha = 1
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = .identity
        }
    }
    
    
    @objc func closepop() {
        
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func ChangePassTaped(_ sender: Any) {
    }
    

}
