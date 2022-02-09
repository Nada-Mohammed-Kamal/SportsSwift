//
//  CoreDataBService.swift
//  SportsSwift
//
//  Created by tasnem on 2/4/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import  CoreData

class CoreDB {
    static let shared = CoreDB()
    static var viewContext  = persistentContainer.viewContext
    private init(){}
    
    
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SportsSwift")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
     func saveContext () {
        //     let context = persistentContainer.viewContext
        if CoreDB.viewContext.hasChanges {
            do {
                try CoreDB.viewContext.save()
                print("Saved Successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func insert(myLeague: League) {
        guard let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagueModel", in: CoreDB.viewContext ) else {
            fatalError("Failed to decode User")
        }
        let newleague = FavouriteLeagueModel(entity: entity, insertInto: CoreDB.viewContext)
        newleague.idLeague = myLeague.idLeague
        newleague.strLeague = myLeague.strLeague
        newleague.strBadge = myLeague.strBadge
        newleague.strYoutube = myLeague.strYoutube
        do{
            try CoreDB.viewContext.save()
            print("Saved")
        }catch let error{
            print(error.localizedDescription)
        }
    }
    func getAllMovies() -> [FavouriteLeagueModel] {
        var leagues = [FavouriteLeagueModel]()
        //var movie=Movie()
        let fetch  = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagueModel")
        do{
            leagues = try CoreDB.viewContext.fetch(fetch) as! [FavouriteLeagueModel]
        }catch let error{
            print(error.localizedDescription)
        }
        return leagues
    }
    
//    func delete(leaguID: String) {
//        //CoreDB.viewContext.delete(leaguID)
//        do{
//            try CoreDB.viewContext.save()
//            //people.remove(at: 0)
//
//        }catch let error{
//            print(error.localizedDescription)
//        }
//    }
    
    
     func delete(withID: String) {
        let fetchRequest: NSFetchRequest<FavouriteLeagueModel> = FavouriteLeagueModel.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "idLeague=='\(withID)'")
        if let result = try? CoreDB.viewContext.fetch(fetchRequest) {
            for object in result {
                CoreDB.viewContext.delete(object)
            }
        }
        CoreDB.shared.saveContext()
    }
    
    
    func checkIFExistInDatabase(withID: String) -> Bool{
        let fetchRequest: NSFetchRequest<FavouriteLeagueModel> = FavouriteLeagueModel.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "idLeague=='\(withID)'")
        if let result = try? CoreDB.viewContext.fetch(fetchRequest) {
                if result.count > 0
                {
                    return true
            }
        }
        return false
    }
    
}

