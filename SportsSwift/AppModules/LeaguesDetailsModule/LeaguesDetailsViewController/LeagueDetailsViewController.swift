//
//  LeagueeViewController.swift
//  SportsApp
//
//  Created by nada elmasry on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import CoreData

protocol LeagueDetailsPresenterToVC {
    func didFetchDataSuccessfully()
    func didFetchEventSuccessfully()
}
class LeagueDetailsViewController: UIViewController, LeagueDetailsPresenterToVC{
  
    @IBOutlet weak var heartButton: UIButton!
    
    //MARK: cell size variablels
    let spacing : CGFloat = 5.0
    //var coreDB = CoreDB(appDelegate: UIApplication.shared.delegate as! AppDelegate)
        
    //MARK:- Vars
    var leaguePresenterRef : LeagueDetailsPresenter!
    let spinner = UIActivityIndicatorView(style: .large)

    var LeagueID : String?
    var isPressed : Bool?
    

    @IBOutlet weak var LeagueNameLabel: UILabel!
    //MARK: IBOutLets
    @IBOutlet weak var AppIconImageView: UIImageView!
    @IBOutlet weak var UpcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var LatestResultCollectionView: UICollectionView!
    @IBOutlet weak var TeamsCollectionView: UICollectionView!
    //MARK: viewDidLoadFunction
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUpCollectionViewDelegation()
        
        //leaguePresenterRef = LeagueDetailsPresenter(view: self , appDelegate: UIApplication.shared.delegate as! AppDelegate, leagueObj: lea)
        leaguePresenterRef.viewDidLoad()
        
        
       // let leagueName = leagueObject?.strLeague
       // LeagueNameLabel.text = leagueName
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
        @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
            dismiss(animated: true, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func AddLeagueToFavouriteAction(_ sender: Any) {
        //isPressed = true
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        print("In AddLeagueToFavouriteAction in Button add")
        guard let obj = leaguePresenterRef.leagueObject else {return}
        leaguePresenterRef.addToFavourite(league: obj)
    }
}
