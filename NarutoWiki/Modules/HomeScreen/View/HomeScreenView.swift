//
//  HomeScreenView.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//
//  This file was generated by the 🖤 Popcode's MVVM generator.
//

import UIKit

protocol HomeScreenViewDelegate: AnyObject {}

final class HomeScreenView: UIView {
    
    weak var delegate: HomeScreenViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 160),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerImageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerImageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        return tableView
    }()
    
    private lazy var headerView: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .systemGray6
        header.addSubview(headerImageView)
        header.addSubview(headerTitle)
        return header
    }()
    
    private lazy var headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.image = .init(named: "header")
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        return headerImageView
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "NARUTO WIKI"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
