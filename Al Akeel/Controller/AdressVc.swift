//
//  AdressVc.swift
//  Al Akeel
//
//  Created by Mohamed on 10/18/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire

class AdressVc: UIViewController {
    
    
    //MARK: -Outlet
    @IBOutlet weak var NameTxt: UITextField!
    @IBOutlet weak var CityName: UITextField!
    @IBOutlet weak var Regionname: UITextField!
    @IBOutlet weak var DetalisTxt: UITextField!
    @IBOutlet weak var LongituedLabel: UILabel!
    @IBOutlet weak var latituedlabel: UILabel!
    @IBOutlet weak var Notes: UITextField!
    @IBOutlet weak var MapVieww: MKMapView!
    
    //MARK: -properties
    var locManager = CLLocationManager()
    let Region = ["Egypt","Canada","USA","UAE","Mocoroo"]
    let Cityes = ["Nasar City","Qanter El kheriea","New cairo","West El Balad","New Captial"]
    var RegionPickerView = UIPickerView()
    var CityesPickerView = UIPickerView()
    let ApiAdress = "https://student.valuxapps.com/api/addresses"
    
    //MARK: -App life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Regionname.inputView = RegionPickerView
        CityName.inputView = CityesPickerView
        RegionPickerView.delegate = self
        RegionPickerView.dataSource = self
        CityesPickerView.delegate  =  self
        CityesPickerView.dataSource = self
        RegionPickerView.tag = 1
        CityesPickerView.tag = 2
       
            }
    
    
    //MARK: -Actions
    @IBAction func DismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueTapBtnOreder(_ sender: Any) {
        
        AddAdress()
        
        
    }
    
    //MARK: -Methods
    
    func AddAdress() {
        var currentLocation: CLLocation!

               if
                  CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                  CLLocationManager.authorizationStatus() ==  .authorizedAlways
               {
                   currentLocation = locManager.location
               }
              
//               LongituedLabel.text! = "\(currentLocation?.coordinate.longitude)"
//               latituedlabel.text! = "\(currentLocation?.coordinate.latitude)"
               
        
        let param = [
            "name": NameTxt.text!,
            "city": CityName.text!,
            "region": Regionname.text!,
            "details":DetalisTxt.text!,
            "latitude": currentLocation?.coordinate.longitude ?? 0.0 ,
            "longitude": currentLocation?.coordinate.latitude ?? 0.0,
            "notes":Notes.text!
            ] as [String : Any]
        let headers:HTTPHeaders = ["lang": "ar","Content-Type": "application/json","Authorization":"DsSfMszllEXGvVGsLZGBQUnm6Onit8eAI89Uoq0caMq1grWAt7CCG1do7bsO1wjRjGILUM"]
        
    
        
        ApiService.Shared.fetchData(url: ApiAdress, parms: param, headers: headers, method: .post) {[weak self] (Sucess:AdressModalSucess?, fail:AdressModalFail?, error) in
            guard let self = self else {return}
            if let error = error {
                
                self.AlertError(title: "Error", msg: error.localizedDescription)
            }
            
            else if let adressfail=fail {
                
                self.AlertError(title: "Error", msg: adressfail.message ?? "")
                
                
            }
            
            else {
                
                if Sucess?.status ?? false {
                    
                     let Alert = UIAlertController(title: "Sucess", message: "شكرا انك سجلت عنوانك", preferredStyle: .alert)
                              let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                              Alert.addAction(action)
                    let vc = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarVC
                    vc?.modalPresentationStyle = .fullScreen
                    self.present(vc!, animated: true, completion: nil)
                    self.present(Alert, animated:true) {
                        self.present(vc!, animated: true, completion: nil)
                    }
                    
                }
            }
        }
        
        
        
        
        
        
        
    }
    func AlertError(title:String , msg:String) {
           
           let Alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .default, handler: nil)
           Alert.addAction(action)
           present(Alert, animated: true, completion: nil)
       }
    
    
    
    
    
}

    
    
    
    
    

extension AdressVc : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return Region.count
        case 2:
            return Cityes.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return Region[row]
        case 2:
            return Cityes[row]
        default:
            return "Data Can't load.."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            Regionname.text =  Region[row]
            Regionname.resignFirstResponder()
        case 2:
            CityName.text =  Cityes[row]
            CityName.resignFirstResponder()
        default:
            return
        }
    }
    
    
    
    
    
}
