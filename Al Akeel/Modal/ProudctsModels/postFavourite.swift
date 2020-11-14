// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getFavouriteModel = try? newJSONDecoder().decode(GetFavouriteModel.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getFavouriteDetailPost = try? newJSONDecoder().decode(GetFavouriteDetailPost.self, from: jsonData)

import Foundation

// MARK: - GetFavouriteDetailPost
struct GetFavouriteDetailPost: Codable {
    var status: Bool?
    var message: String?
    var data: DataSucessFav?
}

// MARK: - DataClass
struct DataSucessFav: Codable {
    var id: Int?
    var product: Product?
}

// MARK: - Product
struct Product: Codable {
    var id, price, oldPrice, discount: Int?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}

