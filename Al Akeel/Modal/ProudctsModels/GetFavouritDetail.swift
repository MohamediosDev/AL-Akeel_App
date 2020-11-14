// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getFavouriteDetail = try? newJSONDecoder().decode(GetFavouriteDetail.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getFavouriteDetailGet = try? newJSONDecoder().decode(GetFavouriteDetailGet.self, from: jsonData)

import Foundation

// MARK: - GetFavouriteDetailGet
struct GetFavouriteDetailGet: Codable {
    var status: Bool?
    var message: String?
    var data: proudctFav?
}

// MARK: - DataClass
struct proudctFav: Codable {
    var currentPage: Int?
    var data: [DataFav]?
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
struct DataFav: Codable {
    var id: Int?
    var product: ProductFav?
}

// MARK: - Product
struct ProductFav: Codable {
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

