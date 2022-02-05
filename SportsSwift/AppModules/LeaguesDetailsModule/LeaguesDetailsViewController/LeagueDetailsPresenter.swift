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
    var DB : CoreDB?
    
    let api : TeamsAPIModelProtocol = TeamsAPIModel()
    var teams = [TeamsClass]()
    var events = [RecentEvents]()
    var FinishedEvents = [RecentEvents]()
    var UpcomingEvents = [RecentEvents]()
    
    init(view: LeagueDetailsViewController, appDelegate : AppDelegate) {
        self.view = view
        self.DB = CoreDB(appDelegate: appDelegate)
    }
    
    func viewDidLoad() {
        getAllTeamsFpromPresenter()
        getAllEventsFpromPresenter()
    }
    
    func getAllTeamsFpromPresenter(){
        api.getData(leagueName: (view?.leagueObject!.strLeague)!) {[weak self](result) in
            print(result)
            switch result
            {
            case .success(let response):
                guard let myResponse = response else { return }
                self!.teams = myResponse.teams!
                print("Teams = \(self!.teams.count)")
                self!.view?.fetchingTeamsDataSuccess()
            case .failure(let error):
                print(error.localizedDescription)
                print("\nFailed to fetch all teams data in League Details")
            }
        }
    }
    func getAllEventsFpromPresenter(){
        api.getEvents(leagueID: (view?.leagueObject!.idLeague!)!) {[weak self](result) in
            print("events")
            print(result)
            switch result
            {
            case .success(let response):
                guard let myResponse = response else { return }
                self!.events = myResponse.events!

                if let events = self?.events{
                    for event in events {
                        if event.strStatus == "Match Finished" || (event.convertStringToDate(str: event.strTimestamp ?? "") < Date()) {
                            
                            self?.FinishedEvents.append(event)
                            event.getDateAndTimeFromTimeStamp()
                            self!.view?.fetchingLatestDataSuccess()
                        }
                        else if (event.convertStringToDate(str: event.strTimestamp ?? "")) >= Date(){
                            
                            self?.UpcomingEvents.append(event)
                            event.getDateAndTimeFromTimeStamp()
                            self!.view?.fetchingUpcomingDataSuccess()
                        }
                    }}
                print(response?.events?.count as Any)
            case .failure(let error):
                print(error.localizedDescription)
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
    
    func addToFavourite(league: FavouriteCoreDataModel) {
        print("In addToFavourite in FavoritesTableViewController")
        print(league.strLeague!)
        self.DB!.insert(myLeague: league)
    }
    
    /*var favoRef: addToFavourites?
    var VCRef : LeagueDetailsPresenterToVC?
    var leaugeStr : String?
    var leaugeid : String?
    var leagueObject : League?
    
    func getLeageName() -> String {
        return self.leaugeStr ?? ""
    }*/
}
