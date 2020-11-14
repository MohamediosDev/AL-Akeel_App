//
//  BannerMoadel.swift
//
//  Created by Mohamed on 10/6/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BannerMoadel: Codable {

  enum CodingKeys: String, CodingKey {
    case data
    case status
  }

  var data: [Data]?
  var status: Bool?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    data = try container.decodeIfPresent([Data].self, forKey: .data)
    status = try container.decodeIfPresent(Bool.self, forKey: .status)
  }

}
