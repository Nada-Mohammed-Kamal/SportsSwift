//
//  AllSports.swift
//  SportsApp
//
//  Created by tasnem on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
enum AllSportsNetworking{
    case getAllSports
}


extension AllSportsNetworking: TargetType {
    var baseURL: String {
        switch self {

        default:
            return "https://www.thesportsdb.com/api/v1/json/2/"
    }
    }
    var path: String {
        switch self {
        case .getAllSports:
            return "all_sports.php"
        
    }
}
    var method: HTTPMethod {
        switch self {
        case .getAllSports:
            return .get
        
        }
    }
    
    var task: Task {
        switch self {
        case .getAllSports:
            return .requestPlain
      
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}

