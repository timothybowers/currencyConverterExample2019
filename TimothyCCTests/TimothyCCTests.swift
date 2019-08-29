//
//  TimothyCCTests.swift
//  TimothyCCTests
//
//  Created by Timothy on 19/8/19.
//  Copyright © 2019 Timothy. All rights reserved.
//

import XCTest
@testable import TimothyCC

class TimothyCCTests: XCTestCase {

    func testRateCalculation() {
        let viewModel = CurrencyViewModel()
        var value = viewModel.rateFromAud(buyTT: "1.2.1")
        XCTAssert(value == nil)
        value = viewModel.rateFromAud(buyTT: "abc")
        XCTAssert(value == nil)
        value = viewModel.rateFromAud(buyTT: "123")
        XCTAssert(value == 123)
        value = viewModel.rateFromAud(buyTT: "123.789")
        XCTAssert(value == 123.78)
        value = viewModel.rateFromAud(buyTT: "123")
        XCTAssert(value == 123)
    }

    func testSetAUD() {
        let viewModel = CurrencyViewModel()
        viewModel.recalculate(value: 100)
        XCTAssertEqual(viewModel.audValue, 100)
    }

    func testTruncateDouble() {
        var doubleValue = 100.12345
        XCTAssertEqual(doubleValue.truncate(places: 2), 100.12)
        XCTAssertEqual(doubleValue.truncate(places: 1), 100.1)
        XCTAssertEqual(doubleValue.truncate(places: 0), 100)
        
        doubleValue = 0.12345
        XCTAssertEqual(doubleValue.truncate(places: 2), 0.12)
        XCTAssertEqual(doubleValue.truncate(places: 1), 0.1)
        XCTAssertEqual(doubleValue.truncate(places: 0), 0)

        doubleValue = 123.00
        XCTAssertEqual(doubleValue.truncate(places: 2), 123.00)
        XCTAssertEqual(doubleValue.truncate(places: 1), 123.00)
        XCTAssertEqual(doubleValue.truncate(places: 0), 123.00)

    }
}
