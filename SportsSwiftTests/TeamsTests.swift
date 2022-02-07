//
//  SportsSwiftTests.swift
//  SportsSwiftTests
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import XCTest
@testable import SportsSwift

class TeamsTests: XCTestCase {
    
    var teamsObj = TeamsAPIModel()
    
    func testGetTeamsAPI(){
        let expec = expectation(description: "Waiting for teams to be fetched from the api")
        teamsObj.getData(leagueName: "English Premier League") { (result) in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data)
                expec.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
