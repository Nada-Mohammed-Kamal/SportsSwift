//
//  UpcomingEventsNetworkingAPI.swift
//  SportsSwift
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

protocol  UpcomingEventsNetworkingAPIProtocol{
    func getUpcomingEvents(completion :@escaping (Result<AllEventsFromAPI? , Error>) -> Void)
}



class  UpcomingEventsNetworkingAPI: BaseAPI<UpcomingEventsNetworking> , UpcomingEventsNetworkingAPIProtocol{
    
    
    //MARK:- a3'ayar al raqam al static da bta3 al league id
    func getUpcomingEvents(completion :@escaping (Result<AllEventsFromAPI? , Error>) -> Void) {
        self.fetchData(target: .getUpcomingEvents(leaugueId: "4905"), responseClass: AllEventsFromAPI.self) { (result) in
            completion(result)
        }
    }
}



