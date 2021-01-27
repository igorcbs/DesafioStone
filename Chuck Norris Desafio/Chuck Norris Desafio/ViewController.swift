//
//  ViewController.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    //Criando uma instancia da storyboard
    static func instantiate() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let view = storyboard.instantiateInitialViewController() as! ViewController
        
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        self.view.backgroundColor = .gray
        let serach = "stronger"
        
        let service = RequestCalling()
        
        service.fetchFacts(with: serach).subscribe(onNext: { facts in
            print(facts)
        }).disposed(by: disposeBag)
        
        
    }


}

