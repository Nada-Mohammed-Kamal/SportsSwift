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
        
        //3ayza a filter al array ano maya3rdsh al 7agat al mtkarara aw mydafhash aslan
        /*var result = [FavouriteLeagueModel]()
        for value in array {
            if result.contains(value) == false {
            result.append(value)
            }
        }
        
        */
        print(array.count)
        self.view.UpdateTabel()
    }
    
    func deleteLeague(atIndex index: Int){
        CoreDB.shared.delete(withID: array[index].idLeague ?? "" )
        self.array.remove(at: index)
        self.view.UpdateTabel()
    }
    
    
}
