//
//  IntermediateViewController.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class IntermediateViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyConstraints()
        title = "Intermediate"
    }
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let viewModel = IntermediateViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView
            .translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
}

// MARK: - Binding
extension IntermediateViewController {
    private func bindTableView() {
        viewModel.items
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup
extension IntermediateViewController {
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
