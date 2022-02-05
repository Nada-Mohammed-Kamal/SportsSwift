//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by tasnem on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

class LeaguesPresenter{
    var NetworkLeagueSer : AllLeagesAPIProtocol!
     var leagues = [League]()
     weak var view : LeaguesTableViewController?
     init(NetworkLeagueSer: AllLeagesAPIProtocol, view : LeaguesTableViewController){
        self.view = view
        self.NetworkLeagueSer = NetworkLeagueSer
    }
     func getAllLeagues(){
        NetworkLeagueSer.getAllLeagues (sportName:(view?.sport?.strSport)!){ (result) in
        switch result {
            case .success(let response):
              self.leagues = response!.countrys
              self.view?.UpdateTabel()
              print(self.leagues.count)
           case .failure(let error):
            print(error.localizedDescription)
             
            }
        }
    }
}
