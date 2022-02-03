//
//  TeamsNetworking.swift
//  SportsApp
//
//  Created by nada elmasry on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//


//https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4905&strStatus=Match%20Finished
//MARK:- lesa hena al parameters msh 3rfa ha5odha azay


import Foundation
import Alamofire


enum  UpcomingEventsNetworking{
    case getUpcomingEvents(leaugueId : String , strStatus : String , Eventdate : String , EventTime : String)
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
        case .getUpcomingEvents(let leagueId , let status , let Eventdate ,let EventTime):
            return .requestParameters(parameters: ["id" : leagueId , "strStatus" : status , "dateEventLocal" : Eventdate , "strTimeLocal" : EventTime] , encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]?{
        switch self {
        default:
            return [:]
        }
    }
}
