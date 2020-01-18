//
//  AdvancedDataSource.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import RxDataSources

enum AdvancedTableViewItem {
    /// Represents a cell with a collection view inside
    case GridTableViewItem(titles: [String])
    /// Represents a cell with a switch
    case SwitchTableViewItem(isOn: Bool)
    /// Represents a cell with a disclosure indicator
    case IndicatorTableViewItem
}

enum AdvancedTableViewSection {
    case GridSection(items: [AdvancedTableViewItem])
    case CustomSection(items: [AdvancedTableViewItem])
}

extension AdvancedTableViewSection: SectionModelType {
    typealias Item = AdvancedTableViewItem

    var header: String {
        switch self {
        case .GridSection:
            return "Grid Section"
        case .CustomSection:
            return "Custom Section"
        }
    }
    
    var items: [AdvancedTableViewItem] {
        switch self {
        case .GridSection(items: let items):
            return items
        case .CustomSection(items: let items):
            return items
        }
    }
    
    init(original: Self, items: [Self.Item]) {
        self = original
    }
}

struct AdvancedDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource<AdvancedTableViewSection> {
        return .init(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
            
            switch dataSource[indexPath] {
            case let .GridTableViewItem(titles):
                let cell = AdvancedGridTableViewCell()
                cell.viewModel = GridViewModel(titles: titles)
                return cell
            case .IndicatorTableViewItem:
                let cell = AdvancedIndicatorTableViewCell()
                cell.accessoryType = .disclosureIndicator
                return cell
            case let .SwitchTableViewItem(isOn):
                let cell = AdvancedSwitchTableViewCell()
                cell.switch.isOn = isOn
                return cell
            }
        }, titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].header
        })
    }
}
