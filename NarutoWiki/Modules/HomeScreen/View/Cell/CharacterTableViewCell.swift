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
        cellView.addSubview(cellTitle)
        cellView.addSubview(cellDescription)
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
    
    private lazy var cellTitle: UILabel = {
        let cellTitle = UILabel()
        cellTitle.text = "NARUTO WIKI"
        cellTitle.textColor = .black
        cellTitle.font = .systemFont(ofSize: 14.0, weight: .bold)
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        return cellTitle
    }()
    
    private lazy var cellDescription: UILabel = {
        let cellDescription = UILabel()
        cellDescription.text = "NARUTO WIKI"
        cellDescription.textColor = .black
        cellDescription.font = .systemFont(ofSize: 14.0, weight: .bold)
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        return cellDescription
    }()
    
    private lazy var clanLabel: UILabel = {
        let clanLabel = UILabel()
        clanLabel.text = "NARUTO WIKI"
        clanLabel.textColor = .black
        clanLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
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
            cellTitle.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellTitle.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 10),
            cellDescription.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(index: Int) {
        if index == 0 {
            self.cellTitle.text = "Posicoes"
        } else {
            self.cellTitle.text = "Com você"
        }
    }
}
