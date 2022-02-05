//
//  LatesetEventsNetworkingAPI.swift
//  SportsSwift
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

protocol  LatesetEventsNetworkingAPIProtocol{
    func getLatesetEvents(completion :@escaping (Result<AllEventsFromAPI? , Error>) -> Void)
}

class LatesetEventsNetworkingAPI : BaseAPI<LatesetEventsNEtworking>,LatesetEventsNetworkingAPIProtocol {

    //MARK:- a3'ayar al raqam al static da bta3 al league id
    func getLatesetEvents(completion :@escaping (Result<AllEventsFromAPI? , Error>) -> Void){
        self.fetchData(target: .getLatestEvents(leaugueId: "4095"), responseClass: AllEventsFromAPI.self) { (result) in
            completion(result)
        }
    }
}

