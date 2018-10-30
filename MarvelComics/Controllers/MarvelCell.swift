//
//  MarvelCell.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/1/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

class MarvelCell: UICollectionViewCell {
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            charactersNameLabel.text = character.name
            
            guard let characterImageUrl = character.thumbnail.path else { return }
            let thumbnailExtension = character.thumbnail.thumbnailExtension.rawValue
            
            charactersImageView.loadImage(urlString: characterImageUrl + "." + thumbnailExtension)
        }
    }
    
    let charactersImageView: ImageViewCache = {
        let iv = ImageViewCache()
        iv.image = #imageLiteral(resourceName: "IronMan").withRenderingMode(.alwaysOriginal)
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let charactersNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        backgroundColor = .yellow
        
        let stackView = UIStackView(arrangedSubviews: [charactersImageView, charactersNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPad: 0, leftPad: 0, bottomPad: 0, rightPad: 0, width: 0, height: 0)
        
        charactersImageView.heightAnchor.constraint(equalTo: charactersImageView.widthAnchor).isActive = true
        
//        addSubview(charactersImageView)
//        charactersImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topPad: 0, leftPad: 0, bottomPad: 0, rightPad: 0, width: 0, height: 0)
 
//        addSubview(charactersNameLabel)
//        charactersNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPad: 0, leftPad: 0, bottomPad: 0, rightPad: 0, width: 0, height: 0)
    }
}
