//
//  BannerModel.swift
//  Al Akeel
//
//  Created by Mohamed on 10/8/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct BannerModel: Codable {
    let status: Bool
    let message: String?
    let data: [Bannerimage]
}

// MARK: - Datum
struct Bannerimage: Codable {
    let id: Int?
    let image: String?
    let category, product: Int??
}

