//
//  AppDelegate.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/1/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let marvelController = MarvelController(collectionViewLayout: UICollectionViewFlowLayout())
        let marvelNavController = UINavigationController(rootViewController: marvelController)
        window?.rootViewController = marvelNavController
        window?.makeKeyAndVisible()
        
        return true
    }
}

