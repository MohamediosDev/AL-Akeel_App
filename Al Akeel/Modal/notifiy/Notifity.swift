//
//  Notifity.swift
//  Al Akeel
//
//  Created by Mohamed on 10/4/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct NotifyModal: Codable {
    let status: Bool?
    let message: String?
    let data: DataModal?
}

// MARK: - DataClass
struct DataModal: Codable {
    let currentPage: Int?
    var data: [notify]?
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int

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
struct notify: Codable {
    let id: Int?
    let title, message: String
}

