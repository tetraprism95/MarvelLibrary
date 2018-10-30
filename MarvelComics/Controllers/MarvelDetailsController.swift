//
//  MarvelDetailsController.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/3/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

class MarvelDetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let cellId = "cellId"
    
    // Has access to character, now pass it to header.
    var character: Character? {
        didSet {
            guard let character = character else { return }
            
        }
    }
    
    let characterDetailsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionUI()
        setupNavUI()
    }
    
    private func setupCollectionUI() {
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(MarvelDetailsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(MarvelDetailsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func setupNavUI() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack)), animated: true)
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MarvelDetailsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarvelDetailsCell
        cell.character = character
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! MarvelDetailsHeader
        header.character = character
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let viewHeight = view.frame.height
        let headerSize = CGSize(width: view.frame.width, height: viewHeight - 350)
        return headerSize
    }
}
