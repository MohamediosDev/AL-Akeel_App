// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? newJSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    var status: Bool?
    var message: String?
    var data: Datalogin?
}

// MARK: - DataClass
struct Datalogin: Codable {
    var id: Int?
    var name, email, phone: String?
    var image: String?
    var points, credit: Int?
    var token: String?
}
