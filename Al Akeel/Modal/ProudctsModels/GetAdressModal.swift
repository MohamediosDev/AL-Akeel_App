// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getAdressModal = try? newJSONDecoder().decode(GetAdressModal.self, from: jsonData)

import Foundation

// MARK: - GetAdressModal
struct GetAdressModal: Codable {
    var status: Bool?
    var message: String?
    var data: DataGetAdress?
}

// MARK: - DataClass
struct DataGetAdress: Codable {
    var currentPage: Int?
    var data: [dataAdress]?
    var firstPageURL: String?
    var from, lastPage: Int?
    var lastPageURL: String?
    var nextPageURL: String?
    var path: String?
    var perPage: Int?
    var prevPageURL: Int?
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
struct dataAdress: Codable {
    var id: Int?
    var name, city, region, details: String?
    var notes: String?
    var latitude, longitude: Double?
}

