// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getFavouriteDetailGet = try? newJSONDecoder().decode(GetFavouriteDetailGet.self, from: jsonData)

import Foundation

// MARK: - GetFavouriteDetailGet
struct PostCartModel: Codable {
    var status: Bool?
    var message: String?
    var data: DataCart?
}

// MARK: - DataClass
struct DataCart: Codable {
    var id, quantity: Int?
    var product: CartProudct?
}

// MARK: - Product
struct CartProudct: Codable {
    var id, price, oldPrice, discount: Int?
    var image: String?
    var name, productDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
    }
}
