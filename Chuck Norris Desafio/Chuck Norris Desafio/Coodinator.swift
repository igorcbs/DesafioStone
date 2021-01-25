//
//  Coodinator.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//

import UIKit

class Coordinator{
    
    private let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    //Function starts the view controller 
    func start() {
        let viewController = ViewController.instantiate()
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
}
