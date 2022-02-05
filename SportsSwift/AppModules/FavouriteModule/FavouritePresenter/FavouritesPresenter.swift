//
//  FavouritesPresenter.swift
//  SportsSwift
//
//  Created by tasnem on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//



import Foundation
class FavouritPresenter{
  var array = [FavouriteLeagues]()
    let view : FavoritesTableViewControllerProtocol!
    var DB : CoreDB?
    init(view: FavoritesTableViewControllerProtocol , appdelegate : AppDelegate){
        self.DB = CoreDB(appDelegate: appdelegate)
        self.view = view
    }
    func retviveFromCore(){
            //DB.getMyManger()
        array = DB!.getAllMovies()
        self.view.UpdateTabel()
    }
    
 
    
    
}
