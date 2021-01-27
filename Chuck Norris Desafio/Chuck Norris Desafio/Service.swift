//
//  Service.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//
import Foundation
import UIKit
import RxSwift

protocol ResquestFactProtocol {
    func fetchFacts(with search: String) -> Observable<[ChuckNorrisModel]>
}

class RequestCalling: ResquestFactProtocol {
    
    //Atributes
    var facts: [ChuckNorrisModel] = []
    var search = ""
    var category = ""
    var url = "https://api.chucknorris.io/jokes/search?query="
    
    func fetchFacts(with search: String) -> Observable<[ChuckNorrisModel]> {
        
        return Observable.create { observer -> Disposable in
            self.facts.removeAll()
            let request = URL(string: "\(self.url)\(search)")!
            
            let task = URLSession.shared.dataTask(with: request) { (data,response, error) in
                
                guard let dataService = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    //Convert json in NSDictionay
                    let jsonDecoder = try JSONSerialization.jsonObject(with: dataService, options:JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                    
                    for information in jsonDecoder["result"] as! NSMutableArray{
                        
                        //Atribuindo as variaveis as informacoes da api
                        let text = (information as AnyObject)["value"] as? String ?? ""
                        let id = (information as AnyObject)["id"] as? String ?? ""
                        let categories = (information as AnyObject)["categories"] as? NSArray
                        
                        if categories?.count == 0 {
                            self.category = "UNCATEGORIZED"
                        }else {
                            self.category = categories?.object(at: 0) as! String
                        }
                        
                        let fact = ChuckNorrisModel(id: id, fact: text, category: self.category)
                        self.facts.append(fact)
                        
                    }
                    print(self.facts)
                    
                    observer.onNext(self.facts)
                }catch{
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    

}
