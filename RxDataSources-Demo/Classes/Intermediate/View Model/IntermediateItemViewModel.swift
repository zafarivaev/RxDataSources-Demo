//
//  IntermediateItemViewModel.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

/// ViewModel for an individual cell
struct IntermediateItemViewModel {
    
    var title: String
    
    init(itemModel: TableViewItem) {
        self.title = itemModel.title
    }
}
