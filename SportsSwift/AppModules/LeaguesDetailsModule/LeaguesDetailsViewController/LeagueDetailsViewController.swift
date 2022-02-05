//
//  LeagueeViewController.swift
//  SportsApp
//
//  Created by nada elmasry on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

protocol LeagueDetailsPresenterToVC {
    func didFetchDataSuccessfully()
    func didFetchEventSuccessfully()
}
class LeagueDetailsViewController: UIViewController, LeagueDetailsPresenterToVC{
  

    //MARK: cell size variablels
    let spacing : CGFloat = 5.0
        
    //MARK:- Vars
     var teamPresenterRef : LeagueDetailsViewControlerToPresenter!
    let spinner = UIActivityIndicatorView(style: .large)
    

    @IBOutlet weak var LeagueNameLabel: UILabel!
    //MARK: IBOutLets
    @IBOutlet weak var AppIconImageView: UIImageView!
    @IBOutlet weak var UpcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var LatestResultCollectionView: UICollectionView!
    @IBOutlet weak var TeamsCollectionView: UICollectionView!
    //MARK: viewDidLoadFunction
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.backgroundColor = UIColor(white: 0, alpha: 0.2)
        self.view.addSubview(spinner)
        spinner.frame = self.view.frame
        spinner.startAnimating()
        //MARK: Calling SetupDelegationForCollectionViewFunction
        let leagueName = teamPresenterRef.getLeageName()
        LeagueNameLabel.text = leagueName
        SetUpCollectionViewDelegation()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        teamPresenterRef.getAllTeamsFpromPresenter()
        teamPresenterRef.getAllEventsFpromPresenter()
        

        
    }
        @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
            dismiss(animated: true, completion: nil)
    }
    
   
    

    //MARK: IBActions
    @IBAction func AddLeagueToFavouriteAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
