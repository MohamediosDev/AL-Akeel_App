// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ordeModel = try? newJSONDecoder().decode(OrdeModel.self, from: jsonData)

import Foundation

// MARK: - OrdeModel
struct OrdeModel: Codable {
    var status: Bool?
    var message: String?
    var data: DataOrder?
}

// MARK: - DataClass
struct DataOrder: Codable {
    var paymentMethod: String?
    var cost: Int?
    var vat: Double?
    var promoCode: String?
    var discount: Int?
    var points, total: Double?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case paymentMethod = "payment_method"
        case cost, vat
        case promoCode = "promo_code"
        case discount, points, total, id
    }
}

