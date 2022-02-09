//
//  AllSportsTest.swift
//  SportsSwiftTests
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import XCTest
@testable import SportsSwift

class AllSportsTest: XCTestCase {
    
    var SportsAPI = AllSportsAPI()

    override func setUp()  {
       
    }

    override func tearDown() {
       
    }

    func testGetAllSportsAPI()  {
      
        
        let expectaion = expectation(description: "Waiting for AllSports to be fetched from the api")
        SportsAPI.getAllSports { (result) in
                switch result{
                case .success(let data):
                    XCTAssertNotNil(data)
                    expectaion.fulfill()
                case .failure(_):
                    XCTFail()
                }
            }
            waitForExpectations(timeout: 5, handler: nil)
        }
    }
