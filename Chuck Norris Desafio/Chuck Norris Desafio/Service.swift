//
//  Service.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//
import Foundation
import UIKit
import RxSwift

class RequestService {
    
    let url = URL(string: "https://api.chucknorris.io/jokes/random")!

    func request(with baseURL: URL) -> URLRequest {
           var request = URLRequest(url: baseURL)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            return request
    }
}

class RequestCalling {
    
    
    func request<T: Codable>(apiRequest: RequestService) -> Observable<T> {

        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.url)
            
            
        }
        
    }
}
