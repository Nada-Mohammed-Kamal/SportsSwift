//
//  TeamDetailsAPI.swift
//  SportsSwift
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

protocol  TeamDetailsAPIProtocol{
    func getUpcomingEvents(completion :@escaping (Result<AllTeamsApiResultMOdel? , Error>) -> Void)
}

class  TeamDetailsAPI: BaseAPI<TeamDetailsNetworking> , TeamDetailsAPIProtocol{
    
    func getUpcomingEvents(completion :@escaping (Result<AllTeamsApiResultMOdel? , Error>) -> Void) {
        self.fetchData(target: .getTeamDetails(leagueName: "English Premier League"), responseClass: AllTeamsApiResultMOdel.self) { (result) in
            completion(result)
        }
    }
}
