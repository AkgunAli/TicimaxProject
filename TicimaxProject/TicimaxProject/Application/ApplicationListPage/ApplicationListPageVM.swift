//
//  ApplicationListPageVM.swift
//  TicimaxProject
//
//  Created by Ali Akgün on 13.02.2022.
//

import Foundation

class ApplicationListPageVM {
    let memesApi = MemesAPI()
    let title = "Memes List Page"
    var memesResponse = [Memes]()

    
    func getMemes(completion: @escaping () -> ()){
        memesApi.getMemes(succeed: { [weak self] response in
            guard let data = response.data?.memes else { return }
            for meme in data {
                self?.memesResponse.append(meme)
                print("gg",meme.name)
            }
            print(data)
            completion()
        }, failed: { error in
            print("error")
        })
    }
}
