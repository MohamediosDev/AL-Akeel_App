// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getCatogryDetails = try? newJSONDecoder().decode(GetCatogryDetails.self, from: jsonData)

import Foundation

// MARK: - GetCatogryDetails
struct GetCatogryDetails: Codable {
    var status: Bool?
    var message: String?
    var data: CatogryDetail?
}

// MARK: - DataClass
struct CatogryDetail: Codable {
    var currentPage: Int?
    var data: [CatogryData]?
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
struct CatogryData: Codable {
    var id: Int?
    var price: Double?
    var oldPrice, discount: Int?
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

