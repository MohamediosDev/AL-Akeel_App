// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let adressModalSucess = try? newJSONDecoder().decode(AdressModalSucess.self, from: jsonData)

import Foundation

// MARK: - AdressModalSucess
struct AdressModalSucess: Codable {
    var status: Bool?
    var message: String?
    var data: DataAdress?
}

// MARK: - DataClass
struct DataAdress: Codable {
    var name, city, region, details: String?
    var latitude, longitude: Double?
    var notes: String?
    var id: Int?
}
