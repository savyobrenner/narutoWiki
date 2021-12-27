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
        self.addSubview(desejaAcessarLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let desejaAcessarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.text = "Como deseja acessar?"
        return label
    }()
    
    
}
