// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ediitQuntityCart = try? newJSONDecoder().decode(EdiitQuntityCart.self, from: jsonData)

import Foundation

// MARK: - EdiitQuntityCart
struct DeleteCart: Codable {
    var status: Bool?
    var message: String?
    var data: DataClass?
}

// MARK: - DataClass
struct DeletcartData: Codable {
    var cart: DelCart?
    var subTotal, total: Int?

    enum CodingKeys: String, CodingKey {
        case cart
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - Cart
struct DelCart: Codable {
    var id, quantity: Int?
    var product: CartDelete?
}

// MARK: - Product
struct CartDelete: Codable {
    var id, price, oldPrice, discount: Int?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}
