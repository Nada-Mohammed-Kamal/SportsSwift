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
    var popup:UIView!

    
    //MARK: cell size variablels
    let spacing : CGFloat = 5.0
    //var coreDB = CoreDB(appDelegate: UIApplication.shared.delegate as! AppDelegate)
        
    //MARK:- Vars
    var leaguePresenterRef : LeagueDetailsPresenter!
    let spinner = UIActivityIndicatorView(style: .large)

    var LeagueID : String?
    var isPressed : Bool = false
    

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
        let leageName = leaguePresenterRef.getLeagueName()
        LeagueNameLabel.text = leageName
        isPressed = leaguePresenterRef.checkIfInFavourite()
        heartButton.setImage(UIImage(systemName : isPressed ? "heart.fill" : "heart"), for: .normal)
        leaguePresenterRef.viewDidLoad()
        self.showToast(message: "Swipe right to go back", font: .systemFont(ofSize: 12.0))
        self.showAlert()
        //self.showToast(message: "Swipe right to go back", font: .systemFont(ofSize: 12.0))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
        @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
            dismiss(animated: true, completion: nil)
    }
    

    
    
    
    
    //MARK: IBAction
    @IBAction func AddLeagueToFavouriteAction(_ sender: Any) {
        if(isPressed == true)
        {
            //3yza a delete al data mn hena mn al data base
            isPressed = false
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            print("delete from database")
            //leaguePresenterRef.addToFavourite(league: obj)
            leaguePresenterRef.removeFromFav()
            self.showToast(message: "Deleted from favourites", font: .systemFont(ofSize: 12.0))


        }
        else{
            isPressed = true
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("add to database")
            guard let obj = leaguePresenterRef.leagueObject else {return}
            leaguePresenterRef.addToFavourite(league: obj)
            self.showToast(message: "Added to favourites", font: .systemFont(ofSize: 12.0))
        }
        print(isPressed)
        
    }
    
    



    func showAlert() {
        let alert = UIAlertController(title: "Note", message: "Swipe right to go back", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }
    
}


extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
