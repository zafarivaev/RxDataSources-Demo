//
//  IntermediateDataSource.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import RxDataSources

struct TableViewItem {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

struct TableViewSection {
    let items: [TableViewItem]
    let header: String
    
    init(items: [TableViewItem], header: String) {
        self.items = items
        self.header = header
    }
}

extension TableViewSection: SectionModelType {
    typealias Item = TableViewItem
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct IntermediateDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource<TableViewSection> {
        return .init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
            
            let cell = IntermediateTableViewCell()
            cell.viewModel = IntermediateItemViewModel(itemModel: item)
            return cell
        }, titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].header
        })
    }
}
