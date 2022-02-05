//
//  SportsNetworking.swift
//  SportsApp
//
//  Created by nada elmasry on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//


import Foundation
import Alamofire

enum  LatesetEventsNEtworking{
    case getLatestEvents(leaugueId : String)
}

extension LatesetEventsNEtworking : TargetType{
    var method: HTTPMethod {
        switch self {
        case .getLatestEvents:
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
        case .getLatestEvents:
            return "eventsseason.php?"
        }
    }
    
    //https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=1905
    
    var task: Task{
        switch self {
        case .getLatestEvents(let leagueId):
            return .requestParameters(parameters: ["id" : leagueId] , encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

