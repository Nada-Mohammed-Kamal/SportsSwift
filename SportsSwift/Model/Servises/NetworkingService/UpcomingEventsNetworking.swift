//
//  TeamsNetworking.swift
//  SportsApp
//
//  Created by nada elmasry on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//


//https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4905&strStatus=Match%20Finished


import Foundation
import Alamofire


enum  UpcomingEventsNetworking{
    case getUpcomingEvents(leaugueId : String)
}

extension UpcomingEventsNetworking : TargetType{
    var method: HTTPMethod {
        switch self {
        case .getUpcomingEvents:
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
        case .getUpcomingEvents:
            return "eventsseason.php?"
        }
    }
    
    
    
    var task: Task{
        switch self {
        case .getUpcomingEvents(let leagueId):
            return .requestParameters(parameters: ["id" : leagueId ], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]?{
        switch self {
        default:
            return [:]
        }
    }
}
