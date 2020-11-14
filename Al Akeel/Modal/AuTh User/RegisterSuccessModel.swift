//
//  RegisterSuccessModel.swift
//
//  Created by Mohamed on 9/28/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct RegisterSuccessModel: Codable {

  enum CodingKeys: String, CodingKey {
    case msg
    case expires
    case status
    case token
  }

  var msg: String?
  var expires: String?
  var status: Bool?
  var token: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    msg = try container.decodeIfPresent(String.self, forKey: .msg)
    expires = try container.decodeIfPresent(String.self, forKey: .expires)
    status = try container.decodeIfPresent(Bool.self, forKey: .status)
    token = try container.decodeIfPresent(String.self, forKey: .token)
  }

}
