//
//  ApiConstans.swift
//  Al Akeel
//
//  Created by Mohamed on 9/28/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

struct ApiConstans {
    
    var catgory : CatogryData?
    static let Catogry = "https://student.valuxapps.com/api/categories"
    static let pathcatgory = "/\(CatogryDetail.self)"
    static let BaseUrl = "https://jwt-api-train.herokuapp.com/auth/"
    static let Login = "login"
    static let Register = "register"
    static let proudcts = "student.valuxapps.com/api/products?category_id=0"
}
