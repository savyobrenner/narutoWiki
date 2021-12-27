//
//  HomeScreenViewController.swift
//  NarutoWiki
//
//  Created by Brenner on 27/12/21.
//
//  This file was generated by the 🖤 Popcode's MVVM generator.
//

import UIKit

final class HomeScreenViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Class properties
    private var viewModel: HomeScreenViewModelProtocol
    private lazy var viewInstance = HomeScreenView()

    // MARK: - Public properties

    
    // MARK: - Life Cycle
    
    init(viewModel: HomeScreenViewModelProtocol = HomeScreenViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    // MARK: - Class Configurations
    
    // MARK: - UIActions
    
    // MARK: - Class Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(viewInstance)
        NSLayoutConstraint.activate([
            viewInstance.topAnchor.constraint(equalTo: view.topAnchor),
            viewInstance.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewInstance.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewInstance.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setupTableView() {
        viewInstance.tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        viewInstance.tableView.delegate = self
        viewInstance.tableView.dataSource = self
        
        DispatchQueue.main.async {
            self.viewInstance.tableView.reloadData()
        }
    }
    
    private func setupCell(_ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viewInstance.tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.setupCell(index: indexPath.row)
        return cell
    }
}

extension HomeScreenViewController: HomeScreenViewDelegate {}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier) as? CharacterTableViewCell else { return UITableViewCell () }
        cell.setupCell(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SELECIONADO")
    }
}
