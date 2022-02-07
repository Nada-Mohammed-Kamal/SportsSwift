//
//  FavouritesPresenter.swift
//  SportsSwift
//
//  Created by tasnem on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//



import Foundation
class FavouritPresenter{
  var array = [FavouriteLeagueModel]()
    let view : FavoritesTableViewControllerProtocol!
    init(view: FavoritesTableViewControllerProtocol){
        //self.DB = CoreDB(appDelegate: appdelegate)
        self.view = view
    }
    
    func retviveFromCore(){
        //DB.getMyManger()
        array = CoreDB.shared.getAllMovies()
        print(array.count)
        self.view.UpdateTabel()
    }
    
    func deleteLeague(atIndex index: Int){
        self.array.remove(at: index)
    }
    
    
}
