//
//  FavoritesTableViewController.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData

protocol FavoritesTableViewControllerProtocol {
    func UpdateTabel()
}

protocol addToFavourites{
    func addToFavourite(league: FavouriteCoreDataModel)
}

class FavoritesTableViewController: UITableViewController , FavoritesTableViewControllerProtocol{
    
    var favouritPresenter :FavouritPresenter!
       func UpdateTabel() {
            tableView.reloadData()
       }
    
//      var DB = CoreDB.sharedInstance
//      var array = [FavouriteLeagues]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouritPresenter = FavouritPresenter(DB: CoreDB.sharedInstance, view: self)
              favouritPresenter.retviveFromCore()
//         DB.getMyManger()
//         array = DB.getAllMovies()
//            tableView.reloadData()
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritPresenter.array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell

        cell.FavouritCell = favouritPresenter.array[indexPath.row]
        
//        cell.FavoriteImage.layer.cornerRadius = cell.FavoriteImage.frame.size.width/2
//        cell.FavoriteImage.clipsToBounds = true
//       cell.FavoriteImage.kf.setImage(with: URL(string: array[indexPath.row].strBadge ??  "Ball"))
       
        return cell
    }
    

   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.size.height/5
        }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alart=UIAlertController(title: "Delet", message: "Are you sure to delet this movie", preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.favouritPresenter.DB.delete(leagu: self.favouritPresenter.array[indexPath.row])
            self.favouritPresenter.array = self.favouritPresenter.DB.getAllMovies()
            tableView.reloadData()
 
                     }))
        alart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   self.present(alart,animated: true,completion: nil)
      
    }

}
extension FavoritesTableViewController : addToFavourites{
    func addToFavourite(league: FavouriteCoreDataModel) {
        favouritPresenter.DB.getMyManger()
        favouritPresenter.DB.insert(myLeague: league)
       favouritPresenter.array = favouritPresenter.DB.getAllMovies()
        tableView.reloadData()
        
    }
    
 
    
    
}
