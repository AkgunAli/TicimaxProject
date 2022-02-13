//
//  MemesAPI.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import Foundation

class MemesAPI {
    func getMemes( succeed: @escaping (BaseModel<MemesModel>) -> Void,
                   failed: @escaping (ErrorMessage) -> Void) {

        API.shared.request(methotType: .get,
                           params: [:],
                               urlPath: Endpoints.getMemes,
                               succeed: succeed,
                               failed: failed)
    }
}
