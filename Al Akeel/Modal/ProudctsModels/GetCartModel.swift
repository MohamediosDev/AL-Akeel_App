// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getCart = try? newJSONDecoder().decode(GetCart.self, from: jsonData)

import Foundation

// MARK: - GetCart
struct GetCart: Codable {
    var status: Bool?
    var message: String?
    var data: DataGetCart?
}

// MARK: - DataClass
struct DataGetCart: Codable {
    var cartItems: [CartItem]?
    var subTotal, total: Int?

    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - CartItem
struct CartItem: Codable {
    var id, quantity: Int?
    var product: ProudctGetCart?
}

// MARK: - Product
struct ProudctGetCart: Codable {
    var id, price, oldPrice, discount: Int?
    var image: String?
    var name, productDescription: String?
    var images: [String]?
    var inFavorites, inCart: Bool?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}


