//
//  ProudctModel.swift
//  Al Akeel
//
//  Created by Mohamed on 10/3/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let proudctModel = try? newJSONDecoder().decode(ProudctModel.self, from: jsonData)

import Foundation

// MARK: - ProudctModel
struct ProudctModel: Codable {
    var status: Bool?
    var message: String?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var currentPage: Int?
    var data: [proudct]?
    var firstPageURL: String?
    var from, lastPage: Int?
    var lastPageURL: String?
    var nextPageURL: String?
    var path: String?
    var perPage: Int?
    var prevPageURL: String?
    var to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - Datum
struct proudct: Codable {
    var id: Int?
    var price: Double?
    var oldPrice: Int?
    var discount: Int?
    var image: String?
    var name, datumDescription: String?
    var images: [String]?
    var inFavorites, inCart: Bool?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case datumDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}

