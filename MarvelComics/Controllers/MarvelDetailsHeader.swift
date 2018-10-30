//
//  MarvelDetailsHeader.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/4/18.
//  Copyright © 2018 tetra. All rights reserved.
//


import UIKit

class MarvelDetailsHeader: UICollectionViewCell {
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
    
            guard let characterImageUrl = character.thumbnail.path else { return }
            let thumbnailExtension = character.thumbnail.thumbnailExtension.rawValue
            
            characterImageView.loadImage(urlString: characterImageUrl + "." + thumbnailExtension)
        }
    }
    
    let characterImageView: ImageViewCache = {
        let iv = ImageViewCache()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    override init(frame: CGRect) {
        print("About to init")
        super.init(frame: frame)
        
        backgroundColor = .red
        setupHeaderUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupHeaderUI() {
        addSubview(characterImageView)
        characterImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPad: 0, leftPad: 0, bottomPad: 0, rightPad: 0, width: 0, height: 0)
    }
}
