//
//  TeamsAPIModel.swift
//  SportsApp
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation


protocol  TeamsAPIModelProtocol{
    func getData(leagueName : String,completion: @escaping (Result<AllTeamsApiResultMOdel?, Error>) -> Void)
    
    func getEvents(leagueID : String,completion: @escaping (Result<AllEventsFromAPI?, Error>) -> Void)
}

class TeamsAPIModel: BaseAPI<TeamsNetworking> , TeamsAPIModelProtocol {
    func getEvents(leagueID: String, completion: @escaping (Result<AllEventsFromAPI?, Error>) -> Void) {
        self.fetchData(target: .getEvents(leagueId: leagueID), responseClass: AllEventsFromAPI.self)  { (result) in
            completion(result)
        }
    }
    
    func getData(leagueName : String, completion: @escaping (Result<AllTeamsApiResultMOdel?, Error>) -> Void) {
        
        self.fetchData(target: .getTeams(leagueName: leagueName), responseClass: AllTeamsApiResultMOdel.self)  { (result) in
            completion(result)
        }
        
    }
}



