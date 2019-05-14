//
//  File.swift
//  P2MEDriver
//
//  Created by user on 15.01.2019.
//  Copyright © 2019 DenisBaturitskiyDev. All rights reserved.
//

import Foundation

struct Mapper {
    static func decode<T: Decodable>(_ data: Data) -> RootObject<T>? {
        return try? JSONDecoder().decode(RootObject<T>.self, from: data)
    }
}

class RootObject<T: Decodable>: Decodable {
    let data: [T]
    init(data: [T]) {
        self.data = data
    }
}
