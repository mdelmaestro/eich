//
//  eichTests.swift
//  eichTests
//
//  Created by mdelmaestro on 14/01/22.
//

import XCTest
@testable import eich

class eichTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let service = HttpClient(baseURL: "https://api.punkapi.com/v2/")
        let expectation = self.expectation(description: "Http get")
        
        service.get("beers") { result in
            switch result {
            case .success(let response):
                print(response)
                print(try! response.body?.deserialize() ?? "")
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        
        let service = HttpClient(baseURL: "https://api.punkapi.com/v2/")
        let expectation = self.expectation(description: "Http get")
        
            
        self.measure {
            // Put the code you want to measure the time of here.
            
            service.get("beers") { result in
                switch result {
                case .success(let response):
                    print(response)
                    print(try! response.body?.deserialize() ?? "")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
