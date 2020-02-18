//
//  FactsAssignmentTests.swift
//  FactsAssignmentTests
//
//  Created by kushal choudhari on 07/02/20.
//  Copyright © 2020 Yogesh Wagh. All rights reserved.
//

import XCTest
@testable import FactsAssignment

class FactsAssignmentTests: XCTestCase {

    override func setUp() {
        // swiftlint:disable:next line_length
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // swiftlint:disable:next line_length
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    // test Facts Model
    func testFactsViewModel() {
        let fact = Facts(title: "TestTitle", description: "TestDescription", imageHref: "TestURL")
        let factModel = FactsModel(title: "TestScreenTitle", rows: [fact])
        let viewModel = FactsViewModel(factsModel: factModel)
        XCTAssertEqual(viewModel.getScreenTitle(), "TestScreenTitle")
        XCTAssertEqual(viewModel.getNumberOfFacts(), 1)
        XCTAssertEqual(viewModel.getFacts(atIndex: 0).title, "TestTitle" )
        XCTAssertEqual(viewModel.getFacts(atIndex: 0).description, "TestDescription" )
        XCTAssertEqual(viewModel.getFacts(atIndex: 0).imageHref, "TestURL" )
    }
    // test Facts Model
    func testFactsModel() {
        let fact = Facts(title: "TestTitle", description: "TestDescription", imageHref: "TestURL")
        let factModel = FactsModel(title: "TestScreenTitle", rows: [fact])
        XCTAssertEqual(factModel.title, "TestScreenTitle")
    }
    // test Facts
    func testFacts() {
        let fact = Facts(title: "TestTitle", description: "TestDescription", imageHref: "TestURL")
        XCTAssertEqual(fact.title, "TestTitle")
        XCTAssertEqual(fact.description, "TestDescription")
        XCTAssertEqual(fact.imageHref, "TestURL")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
