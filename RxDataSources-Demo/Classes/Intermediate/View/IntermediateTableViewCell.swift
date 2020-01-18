//
//  IntermediateTableViewCell.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class IntermediateTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    var viewModel: IntermediateItemViewModel! {
        didSet {
            self.configure()
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Configuration
extension IntermediateTableViewCell {
    private func configure() {
        self.titleLabel.text = viewModel.title
    }
}

// MARK: - UI Setup
extension IntermediateTableViewCell {
    private func setupUI() {
        self.contentView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor
            .constraint(equalTo: self.contentView.centerXAnchor)
            .isActive = true
        
        titleLabel.centerYAnchor
            .constraint(equalTo: self.contentView.centerYAnchor)
            .isActive = true
    }
}
