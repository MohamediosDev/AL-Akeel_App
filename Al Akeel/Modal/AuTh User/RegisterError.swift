//
//  RegisterErrorModel.swift
//
//  Created by Mohamed on 9/28/20
//  Copyright (c) . All rights reserved.
//

import Foundation


struct RegisterError: Codable {

  enum CodingKeys: String, CodingKey {
    case errors
    case status
  }

  var errors: String?
  var status: Bool?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    errors = try container.decodeIfPresent(String.self, forKey: .errors)
    status = try container.decodeIfPresent(Bool.self, forKey: .status)
  }

}
