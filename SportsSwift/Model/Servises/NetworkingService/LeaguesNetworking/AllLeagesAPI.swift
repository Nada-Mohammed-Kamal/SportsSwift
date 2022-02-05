//
//  AllLeagesAPI.swift
//  SportsApp
//
//  Created by tasnem on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
protocol AllLeagesAPIProtocol {
    func getAllLeagues(sportName: String, completion: @escaping (Result<AllLeagues?, Error>) -> Void)
}


class AllLeagesAPI: BaseAPI<AllLeaguesNetworking>, AllLeagesAPIProtocol{
    
    //MARK:- Requests
    
    func getAllLeagues(sportName: String , completion: @escaping (Result<AllLeagues?, Error>) -> Void) {
        self.fetchData(target: .getAllLeagues(sportName:sportName), responseClass: AllLeagues.self) { (result) in
            completion(result)
        }
    }
}
