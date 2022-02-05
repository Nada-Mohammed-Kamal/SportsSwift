//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
protocol LeaguesTableViewControllerProtocal {
    func UpdateTabel()
}

class LeaguesTableViewController: UITableViewController {
    var sport : Sports?
  
    var leaguePresenter : LeaguesPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
          leaguePresenter = LeaguesPresenter(NetworkLeagueSer: AllLeagesAPI(), view: self)
        leaguePresenter.getAllLeagues()

    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguePresenter.leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell

        cell.leagueCell = leaguePresenter.leagues[indexPath.row]
        

        return cell
    }
    

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UIScreen.main.bounds.size.height/5
     }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PresentLeagueDetailsScreen(leagueId: leaguePresenter.leagues[indexPath.row].strLeague ?? "" , LeagueID: leaguePresenter.leagues[indexPath.row].idLeague ?? "", LeagueObj: leaguePresenter.leagues[indexPath.row])
    }
}
extension LeaguesTableViewController :LeaguesTableViewControllerProtocal{
    func UpdateTabel(){
        self.tableView.reloadData()
    }
    
    func PresentLeagueDetailsScreen(leagueId : String , LeagueID : String , LeagueObj : League) -> Void {
        let LeaguestoryBoard = UIStoryboard(name: "Leages", bundle: nil)
        let LeagueDetailsVC = LeaguestoryBoard.instantiateViewController(withIdentifier: "LeagueeViewController") as! LeagueDetailsViewController
        LeagueDetailsVC.leagueObject = LeagueObj
        self.present(LeagueDetailsVC, animated: true)
    }
}

