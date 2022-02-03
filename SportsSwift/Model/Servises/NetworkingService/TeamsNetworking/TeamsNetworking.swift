//
//  TeamsNetworking.swift
//  SportsApp
//
//  Created by nada elmasry on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire

enum  TeamsNetworking{
    case getTeams(leagueName : String)
}

extension TeamsNetworking : TargetType{
    var method: HTTPMethod {
        switch self {
        case .getTeams:
            return .get
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "https://www.thesportsdb.com/api/v1/json/2/"
        }
    }
    
    var path: String {
        switch self {
        case .getTeams:
            return "search_all_teams.php?"
        }
    }

    
    var task: Task {
        switch self {
        case .getTeams(let leagueName):
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

