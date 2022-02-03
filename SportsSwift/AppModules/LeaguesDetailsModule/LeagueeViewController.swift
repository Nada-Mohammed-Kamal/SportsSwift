//
//  LeagueeViewController.swift
//  SportsApp
//
//  Created by nada elmasry on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit


class LeagueeViewController: UIViewController {
    
    //MARK: cell size variablels
    let spacing : CGFloat = 5.0
    
    
    //MARK:- Vars
    var teamPresenterRef : TeamPresenter?
    var LeagueID : String?

    
    
    //MARK: IBOutLets
    @IBOutlet weak var AppIconImageView: UIImageView!
    @IBOutlet weak var UpcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var LatestResultCollectionView: UICollectionView!
    @IBOutlet weak var TeamsCollectionView: UICollectionView!
    
    //MARK: viewDidLoadFunction
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppIconImageView.image = UIImage(named: "logo")
        //MARK: Calling SetupDelegationForCollectionViewFunction
        SetUpCollectionViewDelegation()
       
        teamPresenterRef = TeamPresenter()
        teamPresenterRef?.FetchAllTeamsData()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
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
