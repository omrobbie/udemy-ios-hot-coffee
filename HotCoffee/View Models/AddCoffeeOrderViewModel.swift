//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by omrobbie on 17/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?

    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }

    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}