//
//  SceneDelegate.swift
//  Chuck Norris Desafio
//
//  Created by Igor de Castro on 22/01/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        //Configuration of view with the coodinator class
        let window = UIWindow(windowScene: scene)
        coordinator = Coordinator(window)
        coordinator?.start()
    }

    

}

