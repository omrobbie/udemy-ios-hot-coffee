//
//  Order.swift
//  HotCoffee
//
//  Created by omrobbie on 16/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

extension Order {

    init?(_ viewModel: AddCoffeeOrderViewModel) {
        guard let name = viewModel.name,
        let email = viewModel.email,
        let selectedType = CoffeeType(rawValue: viewModel.selectedType!.lowercased()),
        let selectedSize = CoffeeSize(rawValue: viewModel.selectedSize!.lowercased())
            else {return nil}

        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
