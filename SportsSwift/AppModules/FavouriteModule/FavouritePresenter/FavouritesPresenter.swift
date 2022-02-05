//
//  FavouritesPresenter.swift
//  SportsSwift
//
//  Created by tasnem on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//



import Foundation
class FavouritPresenter{
var DB = CoreDB.sharedInstance
  var array = [FavouriteLeagues]()
    let view : FavoritesTableViewControllerProtocol!
    
    init(DB:CoreDB ,view: FavoritesTableViewControllerProtocol  ){
        self.DB = DB
        self.view = view
    }
    func retviveFromCore(){
            DB.getMyManger()
            array = DB.getAllMovies()
        self.view.UpdateTabel()
    }
    
 
    
    
}
