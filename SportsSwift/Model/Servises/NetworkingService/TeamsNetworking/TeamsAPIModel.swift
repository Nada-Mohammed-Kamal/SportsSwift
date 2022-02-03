//
//  TeamsAPIModel.swift
//  SportsApp
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

protocol LeaguesAPIProtocol{
    func getData(completion : @escaping (Result<AllTeamsApiResultMOdel?, NSError>) -> Void)
}



class TeamsAPIModel: BaseAPI<TeamsNetworking> , LeaguesAPIProtocol {
    func getData(completion: @escaping (Result<AllTeamsApiResultMOdel?, NSError>) -> Void) {
        
        self.fetchData(target: .getTeams(leagueName: "English Premier League"), responseClass: AllTeamsApiResultMOdel.self)  { (result) in
                   completion(result)
               }
        
    }
}



