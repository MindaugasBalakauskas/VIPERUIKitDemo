//
//  Entity.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import Foundation

struct ProductData: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let id, price: Int
    let title, description: String
}
