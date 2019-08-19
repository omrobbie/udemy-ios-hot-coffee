//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by omrobbie on 16/08/19.
//  Copyright © 2019 omrobbie. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    private var viewModel = AddCoffeeOrderViewModel()
    private var coffeeSizesSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEnv()
    }

    private func setupEnv() {
        coffeeSizesSegmentedControl = UISegmentedControl(items: viewModel.sizes)
        coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(coffeeSizesSegmentedControl)
        coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @IBAction func saveButton(_ sender: Any) {
        let name = nameTextField.text
        let email = emailTextField.text

        let selectedSize = coffeeSizesSegmentedControl.titleForSegment(at: coffeeSizesSegmentedControl.selectedSegmentIndex)

        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee!")
        }

        viewModel.name = name
        viewModel.email = email
        viewModel.selectedSize = selectedSize
        viewModel.selectedType = viewModel.types[indexPath.row]
    }
}

extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.types.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)

        cell.textLabel?.text = viewModel.types[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
