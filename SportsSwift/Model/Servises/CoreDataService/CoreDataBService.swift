//
//  CoreDataBService.swift
//  SportsSwift
//
//  Created by tasnem on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import  CoreData

class CoreDB{
    
    var viewContext : NSManagedObjectContext!
    //static let sharedInstance=CoreDB()
    var appDelegate : AppDelegate!
    
    init(appDelegate: AppDelegate){
        self.appDelegate = appDelegate// UIApplication.shared.delegate as! AppDelegate
        viewContext = appDelegate.persistentContainer.viewContext
    }
    
    func insert(myLeague: FavouriteCoreDataModel) {
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagues", in: viewContext)
        let league = NSManagedObject(entity: entity!, insertInto: viewContext)
        league.setValue(myLeague.strLeague, forKey: "strLeague")
        league.setValue(myLeague.strBadge, forKey: "strBadge")
        league.setValue(myLeague.strYoutube, forKey: "strYoutube")
        do{
            try viewContext.save()
            print("Saved")
            
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    func getAllMovies() -> [FavouriteLeagues] {
        var leagues = [FavouriteLeagues]()
        //var movie=Movie()
        let fetch  = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagues")
        do{
            leagues = try viewContext.fetch(fetch) as! [FavouriteLeagues]
        }catch let error{
            print(error.localizedDescription)
        }
        return leagues
    }
    
    func delete(leagu:FavouriteLeagues) {
        viewContext.delete(leagu)
        do{
            try viewContext.save()
            //people.remove(at: 0)
            
        }catch let error{
            print(error.localizedDescription)
        }
    }
}
