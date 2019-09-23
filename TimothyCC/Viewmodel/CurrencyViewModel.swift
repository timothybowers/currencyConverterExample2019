//
//  CurrencyViewModel.swift
//  TimothyCC
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import Foundation

typealias ViewModelCallback = (() -> Void)

protocol CurrencyViewModelProtocol {

    // MARK: - CurrencyViewModel - CallBacks
    
    var onUpdated: ViewModelCallback? { get set }
    
    // MARK: - CurrencyViewModel - Data
    
    var products: [ProductRateDetails]? { get }
    
    var audValue: Decimal? { get }
    
    // MARK: - CurrencyViewModel - Methods
    
    func fetchLatestCurrencies()
    
    func recalculate(value: Decimal)
    
    func rateFromAud(buyTT: String?) -> String?

}

class CurrencyViewModel: CurrencyViewModelProtocol {
    
    init() {
        self.currencyAPI = CurrencyClient()
        self.currencyRXAPI = CurrencyRXAPI()
    }
    
    // MARK: - Dependencies
    
    private var currencyAPI: CurrencyClient?
    private var currencyRXAPI: CurrencyRXAPI?

    // MARK: - CurrencyViewModel - CallBacks
    
    var onUpdated: ViewModelCallback?
    
    // MARK: - CurrencyViewModel - Data
    
    private(set) var products: [ProductRateDetails]?
    
    private(set) var audValue: Decimal?
    
    // MARK: - CurrencyViewModel - Methods
    
    func fetchLatestCurrencies() {
        
        self.currencyRXAPI?.rxFetchCurrencyData { [weak self] products in

            self?.products = products
            
            self?.onUpdated?()

        }
        
    }
    
    func recalculate(value: Decimal) {
        
        self.audValue = value
        
        self.onUpdated?()
    }
    
    func rateFromAud(buyTT: String?) -> String? {
        guard let buyTT = buyTT else {
            return nil
        }
        guard let rate = Decimal(string: buyTT) else {
            return nil
        }
        guard let audValue = self.audValue else {
            return nil
        }
        return (rate * audValue).stringValue()
    }
    
}
