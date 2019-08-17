//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by omrobbie on 17/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import Foundation

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String {
        return order.name
    }

    var email: String {
        return order.email
    }

    var type: String {
        return order.type.rawValue.capitalized
    }

    var size: String {
        return order.size.rawValue.capitalized
    }
}

class OrderListViewModel {
    var orderViewModel: [OrderViewModel]

    init() {
        orderViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return orderViewModel[index]
    }
}
