//
//  CoreDataSampleTests.swift
//  CoreDataSampleTests
//
//  Created by Kanakatti Shrikant on 06/11/22.
//

import XCTest
@testable import CoreDataSample

class CoreDataSampleTests: XCTestCase {

    var urlSession: URLSession!

    override func setUpWithError() throws {
        try super.setUpWithError()
        urlSession = URLSession(configuration: .default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        urlSession = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersonsApiCall() {
      let urlString = "https://swapi.dev/api/people"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Status code: 200")
      let dataTask = urlSession.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
