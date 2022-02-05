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
    case getEvents(leagueId : String)
}

extension TeamsNetworking : TargetType{
    var method: HTTPMethod {
        switch self {
        case .getTeams:
            return .get
        case .getEvents:
            return .get
        }
    }
    var baseURL: String {
        switch self {
        case .getTeams:
            return "https://www.thesportsdb.com/api/v1/json/2/"
        case .getEvents:
            return "https://www.thesportsdb.com/api/v1/json/2/"
            
        }
    }
    
    var path: String {
        switch self {
        case .getTeams:
            return "search_all_teams.php?"
        case .getEvents:
            return "eventsseason.php?"
        }
    }

    
    var task: Task {
        switch self {
        case .getTeams(let leagueName):
            return .requestParameters(parameters: ["l" : leagueName], encoding: URLEncoding.default)
        case .getEvents(let leagueID):
            return .requestParameters(parameters: ["id" : leagueID], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

