//
//  AdvancedTableViewCell.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AdvancedGridTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    var viewModel: GridViewModel! {
        didSet {
            self.configure()
        }
    }
    
    let cellWidthHeightConstant: CGFloat = 100
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView
            .translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView
            .register(AdvancedCollectionViewCell.self, forCellWithReuseIdentifier: AdvancedCollectionViewCell.reuseIdentifier())
        return collectionView
    }()
}

// MARK: - Binding
extension AdvancedGridTableViewCell {
    private func bindCollectionView() {
        viewModel.titles
            .bind(to:
                collectionView.rx.items(cellIdentifier: AdvancedCollectionViewCell
                    .reuseIdentifier(), cellType: AdvancedCollectionViewCell.self)) { indexPath, title, cell in
                        
                        cell.numberLabel.text = title
                        
        }
        .disposed(by: disposeBag)
    
    }
}

// MARK: - Configuration
extension AdvancedGridTableViewCell {
    private func configure() {
        self.bindCollectionView()
    }
}

// MARK: - UI Setup
extension AdvancedGridTableViewCell {
    private func setupUI() {
        overrideUserInterfaceStyle = .light
        self.contentView.addSubview(collectionView)
        
        collectionView.widthAnchor
            .constraint(equalTo: self.contentView.widthAnchor)
            .isActive = true
        collectionView.heightAnchor
            .constraint(equalTo: self.contentView.heightAnchor)
            .isActive = true
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let numberOfCells = floor(self.contentView.frame.size.width / cellWidthHeightConstant)
        let edgeInsets = (self.contentView.frame.size.width - (numberOfCells * cellWidthHeightConstant)) / (numberOfCells + 1)
        
        print(edgeInsets)
        
        layout.itemSize = CGSize(
            width: cellWidthHeightConstant,
            height: cellWidthHeightConstant)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: edgeInsets,
            bottom: 0,
            right: edgeInsets)
        
        return layout
    }
}
