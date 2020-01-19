//
//  SimpleViewController.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/17/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class SimpleViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyConstraints()
        title = "Simple"
    }
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var viewModel = SimpleViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView
            .translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier())
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
}

// MARK: - Binding
extension SimpleViewController {
    func bindTableView() {
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier())) { indexPath, title, cell in
                
                cell.textLabel?.text = title
        }
        .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup
extension SimpleViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
    }
    
    private func applyConstraints() {
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}
