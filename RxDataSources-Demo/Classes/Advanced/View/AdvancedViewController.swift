//
//  AdvancedViewController.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class AdvancedViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyConstraints()
        title = "Advanced"
    }
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let viewModel = AdvancedViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView
            .translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
}

// MARK: - Binding
extension AdvancedViewController {
    private func bindTableView() {
        viewModel.items
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: - UI Setup
extension AdvancedViewController {
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

extension AdvancedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        default:
            return 100
        }
    }
}
