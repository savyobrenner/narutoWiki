//
//  CharacterTableViewCell.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CharacterTableViewCell"
    
    private lazy var cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .red
        cellView.addSubview(cellImageView)
        cellView.addSubview(characterDescription)
        cellView.addSubview(characterName)
        cellView.addSubview(roleDescription)
        return cellView
    }()
    
    private lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.image = .init(named: "header")
        cellImageView.layer.cornerRadius = 40
        cellImageView.clipsToBounds = true
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        return cellImageView
    }()
    
    private lazy var characterDescription: UILabel = {
        let cellTitle = UILabel()
        cellTitle.text = "Female, 20 years, Blood Type - AB"
        cellTitle.textColor = .black
        cellTitle.font = .systemFont(ofSize: 12.0, weight: .regular)
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        return cellTitle
    }()
    
    private lazy var characterName: UILabel = {
        let cellDescription = UILabel()
        cellDescription.text = "Hinata Hyuga"
        cellDescription.textColor = .black
        cellDescription.font = .systemFont(ofSize: 15.0, weight: .bold)
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        return cellDescription
    }()
    
    private lazy var roleDescription: UILabel = {
        let clanLabel = UILabel()
        clanLabel.text = "Hokage"
        clanLabel.textColor = .black
        clanLabel.font = .systemFont(ofSize: 12.0, weight: .medium)
        clanLabel.translatesAutoresizingMaskIntoConstraints = false
        return clanLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellImageView.leadingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 10),
            cellImageView.heightAnchor.constraint(equalToConstant: 80),
            cellImageView.widthAnchor.constraint(equalToConstant: 80),
            characterDescription.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            characterDescription.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            characterName.topAnchor.constraint(equalTo: characterDescription.bottomAnchor, constant: 10),
            characterName.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            roleDescription.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 10),
            roleDescription.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(character: Character) {
        characterDescription.text = "\(character.info?.sex?.rawValue ?? ""), \(character.info?.age ?? "Private information"), BloodType - \(character.info?.bloodType?.rawValue ?? "Undefined")"
        characterName.text = character.name ?? "Private Character"
        roleDescription.text = character.info?.role ?? "Character Unemployed"
    }
}
