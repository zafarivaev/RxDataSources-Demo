//
//  SimpleViewModel.swift
//  RxDataSources-Demo
//
//  Created by Zafar on 1/17/20.
//  Copyright © 2020 Zafar. All rights reserved.
//
import RxSwift

struct SimpleViewModel {

    var items = Observable<[String]>.of(
        ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    )
        
}
