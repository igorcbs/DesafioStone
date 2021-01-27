//
//  InfoModel.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//

import Foundation

struct ChuckNorrisModel: Decodable {
    let id: String
    let fact: String
    let category: String
    
}


struct ChuckNorrisViewModel {
    private let fact: ChuckNorrisModel
    var text: String {
        return fact.fact
    }
    var category: String {
        if fact.category.capitalized == "" {
            return "UNCATEGORIZED"
        }
        return fact.category.capitalized
    }
    var id: String{
        return fact.id
    }
    init(fact: ChuckNorrisModel) {
        self.fact = fact
    }
}

