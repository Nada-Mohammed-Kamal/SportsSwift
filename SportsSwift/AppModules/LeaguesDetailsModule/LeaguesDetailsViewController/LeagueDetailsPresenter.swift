//
//  LeagueDetailsPresenter.swift
//  SportsSwift
//
//  Created by nada elmasry on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

protocol LeagueDetailsViewControlerToPresenter : AnyObject{
    var teams : [TeamsClass]? { get  set }
    func getAllTeamsFpromPresenter()
    func getAllEventsFpromPresenter()
}
class LeagueDetailsPresenter : LeagueDetailsViewControlerToPresenter {
    let api : TeamsAPIModelProtocol = TeamsAPIModel()
    var VCRef : LeagueDetailsPresenterToVC?
    var leaugeStr : String
    var leaugeid : String
    var teams : [TeamsClass]?
    var events : [RecentEvents]?
    init(leagueName : String , leaugeid : String
    ) {
        leaugeStr = leagueName
        self.leaugeid = leaugeid
    }
    
    func getAllTeamsFpromPresenter(){
        
        
        api.getData(leagueName: leaugeStr) { [weak self](result) in
            print("nada")
            print(result)
            switch result
            {
            case .success(let response):
                self?.teams = response?.teams
                self?.VCRef?.didFetchDataSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
                print("\nFailed to fetch all teams data in League Details")
            }
        }
    }
    
    func getAllEventsFpromPresenter(){
        api.getEvents(leagueID: leaugeid) { [weak self](result) in
            print("events")
            print(result)
            switch result
            {
            case .success(let response):
                self?.events = response?.events
                if let events = self?.events{
                    for event in events {
                        print(event.strEvent)
                    }}
                print(response?.events?.count)
                
                self?.VCRef?.didFetchEventSuccessfully()
            case .failure(let error):
                print(error.localizedDescription)
                print("\nFailed to fetch all teams data in League Details")
            }
        }
    }
}
