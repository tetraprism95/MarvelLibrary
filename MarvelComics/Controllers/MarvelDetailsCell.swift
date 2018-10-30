//
//  MarvelDetailsCell.swift
//  MarvelComics
//
//  Created by Nuri Chun on 9/4/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

class MarvelDetailsCell: UICollectionViewCell {
    
    var character: Character? {
        didSet {
            guard let character = character else { return }
            characterNameLabel.text = character.name
            descriptionAttributedText()
        }
    }
    
    let characterNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Iron Man"
        label.textColor = .black
        label.font = UIFont(name: "Arial-BoldMT", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let characterDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightBlue
        label.text = "Description:"
        label.font = UIFont(name: "Arial-BoldMT", size: 16)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private func descriptionAttributedText() {
        guard let character = character else { return }
        
        let attributedText = NSMutableAttributedString(string: "Description: ", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black,  NSAttributedStringKey.font : UIFont(name: "Arial-BoldMT", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)])
        
        if character.description == "" {
            attributedText.append(NSAttributedString(string: "Unknown.. Mysterious Fella.", attributes: [NSAttributedStringKey.foregroundColor : UIColor.darkGray, NSAttributedStringKey.font : UIFont(name: "Arial-BoldMT", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)]))
        } else {
            attributedText.append(NSAttributedString(string: "\(character.description ?? "Unknown.. Mysterious Fella.")", attributes: [NSAttributedStringKey.foregroundColor : UIColor.darkGray, NSAttributedStringKey.font : UIFont(name: "Arial-BoldMT", size: 13) ?? UIFont.boldSystemFont(ofSize: 13)]))
        }
        
        descriptionLabel.attributedText = attributedText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        backgroundColor = .lightBlue
        
        addSubview(characterNameLabel)
        characterNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        characterNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topPad: 12, leftPad: 20, bottomPad: 0, rightPad: 20, width: 0, height: 50)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: characterNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topPad: 12, leftPad: 12, bottomPad: 0, rightPad: 12, width: 0, height: 0)
        
        //        addSubview(characterDescriptionLabel)
        //        characterDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //        characterDescriptionLabel.anchor(top: characterNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPad: 12, leftPad: 8, bottomPad: 8, rightPad: 8, width: 0, height: 0)
     }
}

