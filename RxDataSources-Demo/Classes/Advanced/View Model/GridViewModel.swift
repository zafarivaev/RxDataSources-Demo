//
//  GridViewModel.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/18/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import RxSwift

struct GridViewModel {
    
    let titles = BehaviorSubject<[String]>(value: [])
    
    init(titles: [String]) {
        self.titles.onNext(titles)
    }
}
