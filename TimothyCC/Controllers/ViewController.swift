//
//  ViewController.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View model
    
    private var viewModel: CurrencyViewModel?

    // MARK: - Private Properties
    
    private var previousInput: String? = "1"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = CurrencyViewModel()
        self.setupViewModel()
        self.viewModel?.fetchLatestCurrencies()
    }

    // MARK: - Setup
    
    func setupViewModel() {
        self.viewModel?.onUpdated = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - IB Actions
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
    
        guard var input = sender.text else {
            return
        }

        // Only allow a maximum of 9 characters for the number because of the size of the input UI
        guard input.count < 10 else {
            sender.text = previousInput
            return
        }

        // Assume 0 when input is empty, because we want 0 for calculation results
        if input.count == 0 {
            input = "0"
        }
        
        // Do not allow non-numeric characters
        if let value = Decimal(string: input) {
            viewModel?.recalculate(value: value)
        } else {
            sender.text = previousInput
        }

        previousInput = sender.text
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as? CurrencyCell else {
            return UITableViewCell()
        }
        
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        guard let products = viewModel.products else {
            return UITableViewCell()
        }
        
        if products.count > indexPath.row {
            let product = products[indexPath.row]
            let currencyName = product.currencyName
            
            if let buyTT = product.buyTT {
                let rate = viewModel.rateFromAud(buyTT: buyTT)
                cell.prepare(name: product.currencyCode, value: rate, currencyName: currencyName)
            }
        }
     
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.products?.count ?? 0
    }
    
    
}
