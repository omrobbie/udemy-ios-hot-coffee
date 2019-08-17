//
//  OrderTableViewController.swift
//  HotCoffee
//
//  Created by omrobbie on 16/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {

    var orderListViewModel = OrderListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }

    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL was incorrect!")
        }

        let resource = Resource<[Order]>(url: coffeeOrdersURL)

        WebService().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                print(orders)
                self?.orderListViewModel.orderViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.orderViewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        let item = orderListViewModel.orderViewModel(at: indexPath.row)

        cell.textLabel?.text = item.type
        cell.detailTextLabel?.text = item.size

        return cell
    }
}
