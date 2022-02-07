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
    func addToFavourite(league: League)
}

class FavoritesTableViewController: UITableViewController , FavoritesTableViewControllerProtocol{
    
    var favouritPresenter :FavouritPresenter!
       func UpdateTabel() {
            tableView.reloadData()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritPresenter = FavouritPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
        favouritPresenter.retviveFromCore()
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.size.height/5
        }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alart=UIAlertController(title: "Delet", message: "Are you sure to delet this movie", preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            tableView.beginUpdates()
            CoreDB.shared.delete(leagu: self.favouritPresenter.array[indexPath.row])
            self.favouritPresenter.deleteLeague(atIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            }))
        alart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   self.present(alart,animated: true,completion: nil)
      
    }

  
    
    
    //redirecting to leagueDetails
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stryBoard = UIStoryboard.init(name: "Leages", bundle: nil)
        let leagueDetailsVC = stryBoard.instantiateViewController(identifier: "LeagueeViewController") as! LeagueDetailsViewController
        let obj = League(idLeague: favouritPresenter.array[indexPath.row].idLeague, strLeague: favouritPresenter.array[indexPath.row].strLeague, strYoutube: favouritPresenter.array[indexPath.row].strYoutube, strBadge: favouritPresenter.array[indexPath.row].strBadge, strLogo: "")
        let leagueDetailsPresenter = LeagueDetailsPresenter(view: leagueDetailsVC, leagueObj: obj)
        leagueDetailsVC.leaguePresenterRef = leagueDetailsPresenter
        //print(obj.idLeague)
        //leagueDetailsVC.leagueObject = obj
        
        //obj.idLeague
        //leagueDetailsVC.leagueObject = favouritPresenter.array[indexPath.row]
        self.present(leagueDetailsVC, animated: true, completion: nil)
    }
}

