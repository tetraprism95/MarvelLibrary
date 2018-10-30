//
//  Character.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/1/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import Foundation

struct Root: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct Character: Codable {
    let id: Int
    let name: String
    let description: String?
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
