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
    var FinishedEvents : [RecentEvents] {get  set}
    var UpcomingEvents : [RecentEvents] {get  set}
    func getAllTeamsFpromPresenter()
    func getAllEventsFpromPresenter()
    func getLeageName() -> String
    /////1-details
    var leagueObject : League? {get set}
    var favoRef : addToFavourites? {get set}
}

protocol leagueProtocol {
    func showIndicator()
    func hideIndicator()
    func fetchingTeamsDataSuccess()
    func fetchingUpcomingDataSuccess()
    func fetchingLatestDataSuccess()
    //func networkError(errorMessage: String)
    //func showError(error: String)
    //func openYoutube(youtubeLink: String)
    func navigateToTeamScreen(team: TeamsClass)
}

class LeagueDetailsPresenter /*: LeagueDetailsViewControlerToPresenter, addToFavourites */{
    
    var view: LeagueDetailsViewController?
    var leagueObject : League!
    let api : TeamsAPIModelProtocol = TeamsAPIModel()
    var teams = [TeamsClass]()
    var events = [RecentEvents]()
    var FinishedEvents = [RecentEvents]()
    var UpcomingEvents = [RecentEvents]()
    
    init(view: LeagueDetailsViewController , leagueObj : League) {
        self.view = view
        self.leagueObject = leagueObj
    }
    
    func getLeagueName() -> String {
        return leagueObject.strLeague ?? ""
    }
    
    func viewDidLoad() {
        getAllTeamsFpromPresenter()
        getAllEventsFpromPresenter()
    }
    
    func getAllTeamsFpromPresenter(){
        api.getData(leagueName: (self.leagueObject.strLeague ?? "")) {[weak self](result) in
            print(result)
            switch result
            {
            case .success(let response):
                guard let myResponse = response else { return }
                self?.teams = myResponse.teams ?? []
                print("Teams = \(self?.teams.count ?? 0)")
                self?.view?.fetchingTeamsDataSuccess()
            case .failure(let error):
                print(error.localizedDescription)
                print("\nFailed to fetch all teams data in League Details")
            }
        }
    }
    
    
    
    
    
    func getAllEventsFpromPresenter(){
        api.getEvents(leagueID: (self.leagueObject.idLeague ?? "") ) {[weak self](result) in
            switch result
            {
            case .success(let response):
                guard let myResponse = response else { return }
                self?.events = myResponse.events ?? []
                
                if let events = self?.events{
                    for event in events {
                        if event.strStatus == "Match Finished" || (event.convertStringToDate(str: event.strTimestamp ?? "") < Date()) {
                            
                            self?.FinishedEvents.append(event)
                            event.getDateAndTimeFromTimeStamp()
                            self?.view?.fetchingLatestDataSuccess()
                        }
                        else if (event.convertStringToDate(str: event.strTimestamp ?? "")) >= Date(){
                            
                            self?.UpcomingEvents.append(event)
                            event.getDateAndTimeFromTimeStamp()
                            self?.view?.fetchingUpcomingDataSuccess()
                        }
                    }}
                print(response?.events?.count as Any)
            case .failure( _):
                print("no data fetched")
                print("\nFailed to fetch all teams data in League Details")
            }
        }
    }
    
    func getTeamsCount() -> Int {
        return teams.count
    }
    
    func getUpcomingCount() -> Int {
        return UpcomingEvents.count
    }
    
    func getLatestCount() -> Int {
        return FinishedEvents.count
    }
    
    func addToFavourite(league: League) {
        print("In addToFavourite in FavoritesTableViewController")
        CoreDB.shared.insert(myLeague: league)
    }
    
    
    func removeFromFav()
    {
        CoreDB.shared.delete(withID: leagueObject.idLeague ?? "")
    }
    
    func checkIfInFavourite() -> Bool {
        return CoreDB.shared.checkIFExistInDatabase(withID: leagueObject.idLeague ?? "")
    }
}
