//
//  ViewController.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/1/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit
import UncommonCrypto

class MarvelController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var characters = [Character]()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUrlSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupNavigationUI()
    }
    
    private func setupUI() {
        collectionView?.backgroundColor = .darkRed
        collectionView?.register(MarvelCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func setupNavigationUI() {
        title = "Characters"
//        let navigationBar = UINavigationBar()
        navigationController?.navigationBar.barTintColor = .darkRed
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.marvelLightGray]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.marvelLightGray]
    }
    
    // Put this in a seperate class APIClient or so.
    private func setupUrlSession() {
//        let hash = hashBase.md5
//        let urlString = "http://gateway.marvel.com/v1/public/characters?apikey=\(publicApiKey)&ts=\(ts)&hash=\(hash)"
        
        let privateKey = "2e2df3c10cfe06dbe10880e7a2cfb6d7514a3826"
        let publicApiKey = "88938aa587c8165e41a036fb68619d49"
        let ts = "557600638"
        let hashBase = ts + privateKey + publicApiKey
        let hash = MD5Generator.md5(for: hashBase)!
        
        let urlString = "http://gateway.marvel.com/v1/public/characters?apikey=\(publicApiKey)&ts=\(ts)&hash=\(hash)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let err = err {
                print("Unable to fetch data:", err)
            }
            
            guard let data = data else { return }
    
            print("DATA:", data)
            
            do {
                let characters = try JSONDecoder().decode(Root.self, from: data)
                
                let characterResults = characters.data.characters
                characterResults.forEach({ (hero) in
                    self.characters.append(hero)
                })
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            } catch let jsonErr {
                print("JSONError:", jsonErr)
            }
        }.resume()
    }
}

extension MarvelController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let character = characters[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarvelCell
        cell.character = character
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Pass down the character chosen at indexPath to marvelDetailsController
        let character = characters[indexPath.item]
        let layout = UICollectionViewFlowLayout()
        let marvelDetailsController = MarvelDetailsController(collectionViewLayout: layout)
        marvelDetailsController.character = character
        navigationController?.pushViewController(marvelDetailsController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidthSize = (view.frame.width - (3 * 16)) / 2
        let cellSize = CGSize(width: cellWidthSize, height: cellWidthSize + 46)
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


