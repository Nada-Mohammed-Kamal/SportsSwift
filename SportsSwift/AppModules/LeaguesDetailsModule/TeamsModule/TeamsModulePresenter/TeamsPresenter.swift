//
//  TeamsPresenter.swift
//  SportsApp
//
//  Created by nada elmasry on 2/3/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation


protocol FetchingTeamsDataProtorolVCAndPresenter {
    func FetchAllTeamsData()
}


class TeamPresenter : FetchingTeamsDataProtorolVCAndPresenter{
    //MARK:-vars
    
    var protocolRef : FetchingTeamsDataProtorolVCAndPresenter?
    
    //MARK:- init
    /*init(view : FetchingTeamsDataProtorolVCAndPresenter) {
        self.protocolRef = view
    }*/
    
    func FetchAllTeamsData(){
        let api : LeaguesAPIProtocol = TeamsAPIModel()
        api.getData { (result) in
            switch result
            {
            case .success(let response):
                let Teams = response?.TeamsArr
                for team in Teams ?? []
                {
                    print("\(String(describing: team.strTeam))\n")
                }
            case .failure(let error):
                print("")
                
            }
        }
    }
}

