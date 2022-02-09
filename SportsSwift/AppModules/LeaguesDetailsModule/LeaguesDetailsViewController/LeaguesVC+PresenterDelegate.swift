//
//  LeaguesVC+PresenterDelegate.swift
//  SportsSwift
//
//  Created by Ahmed on 2/5/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import UIKit

extension LeagueDetailsViewController: leagueProtocol {
    
    func showIndicator() {
        spinner.backgroundColor = UIColor(white: 0, alpha: 0.2)
        self.view.addSubview(spinner)
        spinner.frame = self.view.frame
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func fetchingTeamsDataSuccess() {
        TeamsCollectionView.reloadData()
        self.showToast(message: "Swipe right to go back", font: .systemFont(ofSize: 12.0))
        //self.showAlert()
    }
    
    func fetchingUpcomingDataSuccess() {
        UpcomingEventsCollectionView.reloadData()
    }
    
    func fetchingLatestDataSuccess() {
        LatestResultCollectionView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigateToTeamScreen(team: TeamsClass) {
        /*let storyboard = UIStoryboard(name: "LeaguesDetailsAndTeams", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        leagueDetailsVC.idLeague = country.idLeague
        
        self.present(leagueDetailsVC, animated: true, completion: nil)*/
    }
}
