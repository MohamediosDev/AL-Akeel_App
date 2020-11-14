// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getProfile = try? newJSONDecoder().decode(GetProfile.self, from: jsonData)

import Foundation

// MARK: - GetProfile
struct GetProfile: Codable {
    var status: Bool?
    var message: String?
    var data: Dataprofile?
}

// MARK: - DataClass
struct Dataprofile: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var points, credit: Int?
    var token: String?
}

