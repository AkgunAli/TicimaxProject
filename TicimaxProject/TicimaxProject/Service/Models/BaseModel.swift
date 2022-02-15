//
//  BaseModel.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import Foundation
import ObjectMapper

class BaseModel<S:Mappable>: Mappable{
    var success: Bool?
    var data: S?

    init() {
        // Intentionally unimplemented
    }

    required init?(map: Map) {
        // Intentionally unimplemented
    }

    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}
