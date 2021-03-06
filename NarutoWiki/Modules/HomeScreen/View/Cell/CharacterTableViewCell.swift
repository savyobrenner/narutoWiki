//
//  CharacterTableViewCell.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CharacterTableViewCell"
    
    private enum Strings {
        static let defaultIconImage = "no-photo"
        static let defaultCharacterDescription = "Undefined, Private information, BloodType - Undefined"
        static let defaultCharacterName = "Private Character"
        static let defaultRoleDescription = "Character Unemployed"
        static let undefinedString = "Undefined"
        static let privateString = "Private Information"
        static let bloodTypeString = "Blood Type"
    }
    
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
        cellImageView.image = .init(named: Strings.defaultIconImage)
        cellImageView.contentMode = .redraw
        cellImageView.layer.cornerRadius = 40
        cellImageView.clipsToBounds = true
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        return cellImageView
    }()
    
    private lazy var characterDescription: UILabel = {
        let cellTitle = UILabel()
        cellTitle.text = Strings.defaultCharacterDescription
        cellTitle.textColor = .black
        cellTitle.font = .systemFont(ofSize: 12.0, weight: .regular)
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        return cellTitle
    }()
    
    private lazy var characterName: UILabel = {
        let cellDescription = UILabel()
        cellDescription.text = Strings.defaultCharacterName
        cellDescription.textColor = .black
        cellDescription.font = .systemFont(ofSize: 15.0, weight: .bold)
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        return cellDescription
    }()
    
    private lazy var roleDescription: UILabel = {
        let clanLabel = UILabel()
        clanLabel.text = Strings.defaultRoleDescription
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
    
    override func prepareForReuse() {
        characterDescription.text = Strings.defaultCharacterDescription
        characterName.text = Strings.defaultCharacterName
        roleDescription.text = Strings.defaultRoleDescription
        cellImageView.image = .init(named: Strings.defaultIconImage)
    }
    
    func setupCell(character: Character) {
        characterDescription.text = "\(character.info?.sex?.rawValue ?? Strings.undefinedString), \(character.info?.age ?? Strings.privateString), \(Strings.bloodTypeString) - \(character.info?.bloodType?.rawValue ?? Strings.undefinedString)"
        characterName.text = character.name ?? Strings.defaultCharacterName
        roleDescription.text = character.info?.role ?? Strings.defaultRoleDescription
        downloadImage(from: character.images?.first)
    }
    
    private func downloadImage(from url: String?) {
        guard let urlString = url, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.cellImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
