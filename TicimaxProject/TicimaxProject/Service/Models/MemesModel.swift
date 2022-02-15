//
//  MemesModel.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import Foundation
import ObjectMapper

class MemesModel : Mappable{
    var memes: [Memes]?
    
    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        memes <- map["memes"]
    }
}

class Memes : Mappable{
    var id: String?
    var name: String?
    var url: String?
    var width: Int?
    var height: Int?

    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
    }
}
