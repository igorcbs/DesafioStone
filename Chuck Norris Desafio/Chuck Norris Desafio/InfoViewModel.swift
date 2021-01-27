//
//  InfoViewModel.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 27/01/21.
//

import Foundation
import RxSwift

final class ListsFactsViewModel {
    
    //Titulo da view
    
    
    private let service = RequestCalling()
    
    //Funcao que vai mapiar todos elementos pesquisados
    func fetchApi(with search: String) -> Observable<[ChuckNorrisViewModel]> {
        service.fetchFacts(with: search).map{ $0.map{
            ChuckNorrisViewModel(fact: $0)
        }}
    }
    
    
}

