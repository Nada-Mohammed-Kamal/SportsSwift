//
//  TeamDetails.swift
//  SportsSwift
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire

enum  TeamDetailsNetworking{
    case getTeamDetails(leagueName : String)
}

extension TeamDetailsNetworking : TargetType{
    var method: HTTPMethod {
        switch self {
        case .getTeamDetails:
            return .get
        }
    }
    var baseURL: String {
        switch self {
        default:
            return "https://www.thesportsdb.com/api/v1/json/2/"
        }
    }
    //https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League
    var path: String {
        switch self {
        case .getTeamDetails:
            return "search_all_teams.php?"
        }
    }

    
    var task: Task {
        switch self {
        case .getTeamDetails(let leagueName):
            return .requestParameters(parameters: ["l" : leagueName], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

