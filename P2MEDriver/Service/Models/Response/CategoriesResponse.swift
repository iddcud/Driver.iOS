//
//  CategoriesResponse.swift
//  P2MEDriver
//
//  Created by Q on 22/03/2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    let data: [CategoriesData]?
}

struct CategoriesData: Codable {
    let id, name: String?
    let middleLevel: [CategoriesData]?
    let picture: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case middleLevel = "middle_level"
        case picture
    }
}

