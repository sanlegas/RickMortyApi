//
//  SubclassedCollectionViewCell.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 17/08/22.
//

import Foundation
import UIKit
class SubclassedCollectionViewCell: UICollectionViewCell{
    var character: Character?

    
    let avatarCharacterImg2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.fill")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .red
        return img
    }()
    
    func avatarCharacterImg(image: UIImage)  -> UIImageView {
        let img = UIImageView()
        img.image = image
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .green
        
        return img
    }
    
    func descriptionView(character: Character) -> UIView {
        let view = UIView()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        
        let nameText = UILabel()
        nameText.text = character.name
        nameText.textAlignment = .center
        nameText.textColor = .white
        nameText.numberOfLines = 0
        nameText.lineBreakMode = .byWordWrapping
        nameText.font = UIFont.boldSystemFont(ofSize: 21)
        
        let type = UILabel()
        type.text = "\(character.status) -\(character.species) "
        type.textAlignment = .center
        type.textColor = .gray
        type.font = UIFont.boldSystemFont(ofSize: 17)
        
        let address = UILabel()
        let addressDesc = UILabel()
        addressDesc.text  = "Last known location:"
        addressDesc.textColor = .lightGray
        addressDesc.textAlignment = .center
        
        address.text = character.location.name
        address.textAlignment = .center
        address.numberOfLines = 0
        address.lineBreakMode = .byWordWrapping
        address.textColor = .white
        address.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        let firstSeenDesc = UILabel()
        firstSeenDesc.text = "First seen in:"
        firstSeenDesc.textAlignment = .center
        firstSeenDesc.textColor = .lightGray
        
        let firstSeen = UILabel()
        firstSeen.text = character.firstEpisode
        firstSeen.textColor = .white
        firstSeen.font = address.font
        firstSeen.textAlignment = .center
        
        stackView.addArrangedSubview(nameText)
        stackView.addArrangedSubview(type)
        stackView.addArrangedSubview(addressDesc)
        stackView.addArrangedSubview(address)
        stackView.addArrangedSubview(firstSeenDesc)
        stackView.addArrangedSubview(firstSeen)        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -5)
        ])
        view.backgroundColor = .darkGray
        return view
    }
    
    func setupCell(character: Character){
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.spacing = 0

        let avatarCharacterImg = avatarCharacterImg(image: UIImage(data: character.avatar!)!)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(avatarCharacterImg)
        
        let descriptionView = descriptionView(character: character)
        stackView.addArrangedSubview(descriptionView)
        stackView.backgroundColor = .white
    
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            descriptionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.65),
            avatarCharacterImg.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.35),
            descriptionView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 1)
        ])
        
    }
}
