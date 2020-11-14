// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ediitQuntityCart = try? newJSONDecoder().decode(EdiitQuntityCart.self, from: jsonData)

import Foundation

// MARK: - EdiitQuntityCart
struct EdiitQuntityCart: Codable {
    var status: Bool?
    var message: String?
    var data: DataCartquntity?
}

// MARK: - DataClass
struct DataCartquntity: Codable {
    var cart: Cart?
    var subTotal, total: Int?

    enum CodingKeys: String, CodingKey {
        case cart
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - Cart
struct Cart: Codable {
    var id, quantity: Int?
    var product: proudctEdit?
}

// MARK: - Product
struct proudctEdit: Codable {
    var id, price, oldPrice, discount: Int?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image
    }
}

