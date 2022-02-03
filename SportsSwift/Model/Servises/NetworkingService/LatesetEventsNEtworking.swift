//
//  SportsNetworking.swift
//  SportsApp
//
//  Created by nada elmasry on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//


//MARK:- lesa hena al parameters msh 3rfa ha5odha azay
import Foundation
import Alamofire

enum  LatesetEventsNEtworking{
    case getLatestEvents(leaugueId : String , strStatus : String)
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
    
    
    
    var task: Task{
        switch self {
        case .getLatestEvents(let leagueId , let status):
            return .requestParameters(parameters: ["id" : leagueId , "strStatus" : status] , encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}

