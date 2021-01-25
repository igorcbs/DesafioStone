//
//  ViewController.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//

import UIKit

class ViewController: UIViewController {

    //Criando uma instancia da storyboard
    static func instantiate() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let view = storyboard.instantiateInitialViewController() as! ViewController
        
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }


}

