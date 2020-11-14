// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getOrderModel = try? newJSONDecoder().decode(GetOrderModel.self, from: jsonData)

import Foundation

// MARK: - GetOrderModel
struct GetOrderModel: Codable {
    var status: Bool?
    var message: String?
    var data: DataGetorder?
}

// MARK: - DataClass
struct DataGetorder: Codable {
    var currentPage: Int?
    var data: [orderDetail]?
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
struct orderDetail: Codable {
    var id: Int?
    var total: Double?
    var date, status: String?
}

