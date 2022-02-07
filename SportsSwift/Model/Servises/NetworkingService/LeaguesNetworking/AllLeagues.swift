//
//  AllLeagues.swift
//  SportsApp
//
//  Created by tasnem on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire
enum AllLeaguesNetworking{
    case getAllLeagues(sportName:String)
}


extension AllLeaguesNetworking: TargetType {
    var baseURL: String {
        switch self {
        
        default:
            return "https://www.thesportsdb.com/api/v1/json/2/"
    }
    }
    var path: String {
        switch self {
        case .getAllLeagues:
            return "search_all_leagues.php?"
        
    }
}
    var method: HTTPMethod {
        switch self {
        case .getAllLeagues:
            return .get
        
        }
    }
    
    var task: Task {
        switch self {
        case .getAllLeagues(let sportName):
            return .requestParameters(parameters: ["s" : sportName], encoding: URLEncoding.default)
      
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
