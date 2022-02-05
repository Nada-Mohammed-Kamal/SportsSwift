//
//  AllSportsAPI.swift
//  SportsApp
//
//  Created by tasnem on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
protocol AllSportsAPIProtocol {
    func getAllSports(completion: @escaping (Result<AllSports?, Error>) -> Void)
}


class AllSportsAPI: BaseAPI<AllSportsNetworking>,  AllSportsAPIProtocol{
    
    //MARK:- Requests
    
    func getAllSports(completion: @escaping (Result<AllSports?, Error>) -> Void) {
        self.fetchData(target: .getAllSports, responseClass: AllSports.self) { (result) in
            completion(result)
        }
    }
}
