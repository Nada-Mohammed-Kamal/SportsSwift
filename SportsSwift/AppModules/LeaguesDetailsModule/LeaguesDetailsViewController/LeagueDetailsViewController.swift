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
    var leaguePresenterRef : LeagueDetailsPresenter!
    let spinner = UIActivityIndicatorView(style: .large)

    var LeagueID : String?
    var isPressed : Bool?
    var leagueObject : League?

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
        
        leaguePresenterRef = LeagueDetailsPresenter(view: self , appDelegate: UIApplication.shared.delegate as! AppDelegate)
        leaguePresenterRef.viewDidLoad()
        
        
        //MARK: Calling SetupDelegationForCollectionViewFunction
        let leagueName = leagueObject?.strLeague
        LeagueNameLabel.text = leagueName
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
        @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
            dismiss(animated: true, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func AddLeagueToFavouriteAction(_ sender: Any) {
        //a5aly al icon heart.fill msh heart wa swap bynhom
        isPressed = false
        let nsManagerObj = FavouriteCoreDataModel()
        nsManagerObj.strBadge = leagueObject?.strBadge
        nsManagerObj.strLeague = leagueObject?.strLeague
        nsManagerObj.strYoutube = leagueObject?.strYoutube
        print("In AddLeagueToFavouriteAction in Button add")
        leaguePresenterRef.addToFavourite(league: nsManagerObj)
    }
}
