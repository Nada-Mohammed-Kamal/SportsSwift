//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by nada elmasry on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

class TeamsDetailsViewController: UIViewController {
    //MARK:-IBOutlets
    
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var StadiumView: UIView!
    @IBOutlet weak var KnowAboutUsVIew: UIView!
    
    @IBOutlet weak var descView: UIView!
    
    @IBOutlet weak var AbreviationLabel: UILabel!
    @IBOutlet weak var TeamLogoImageView: UIImageView!
    @IBOutlet weak var CountryNameLabel: UILabel!
    @IBOutlet weak var StadiumNameLabel: UILabel!
    @IBOutlet weak var StadiumImage: UIImageView!
    @IBOutlet weak var contentViewInsideScrollView: UIView!
    @IBOutlet weak var UpperView: UIView!
    @IBOutlet weak var BelowView: UIView!
    @IBOutlet weak var destextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AddingUITOTheTwoUpperView()
        AddingUITOTheTeamsDetailsScrolView()
        presentDataOnTheUI()

        
        /*
AbreviationLabel
        CountryNameLabel
        StadiumNameLabel
StadiumImage
        YoutubeIConImage
        FaceBookIconImage
        */
        
    }
    
    func AddingUITOTheTwoUpperView(){
        UpperView.makeCorner(withRadius: 16.0)
        BelowView.makeCorner(withRadius: 9.0)
        contentViewInsideScrollView.makeCorner(withRadius: 15.0)
        
        UpperView.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        UpperView.layer.shadowRadius = 5
        UpperView.layer.shadowOpacity = 0.1
        UpperView.layer.masksToBounds = false
        UpperView.clipsToBounds = false
        
        
        BelowView.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        BelowView.layer.shadowRadius = 5
        BelowView.layer.shadowOpacity = 0.2
        BelowView.layer.masksToBounds = false
        BelowView.clipsToBounds = false
        
        
        contentViewInsideScrollView.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        contentViewInsideScrollView.layer.shadowRadius = 5
        contentViewInsideScrollView.layer.shadowOpacity = 0.2
        contentViewInsideScrollView.layer.masksToBounds = false
        contentViewInsideScrollView.clipsToBounds = false
    }
    
    
    func AddingUITOTheTeamsDetailsScrolView(){
        contentViewInsideScrollView.makeCorner(withRadius: 20.0)
        countryView.makeCorner(withRadius: 20.0)
        StadiumView.makeCorner(withRadius: 20.0)
        TeamLogoImageView.makeRounded();       destextView.makeCorner(withRadius: 9.0)
        
        contentViewInsideScrollView.layer.shadowOffset = CGSize(width: 10,height: 10)
        contentViewInsideScrollView.layer.shadowRadius = 5
        contentViewInsideScrollView.layer.shadowOpacity = 0.3
        contentViewInsideScrollView.layer.masksToBounds = false
        contentViewInsideScrollView.clipsToBounds = false
        
        
        destextView.layer.shadowOffset = CGSize(width: 10,height: 10)
        destextView.layer.shadowRadius = 5
        destextView.layer.shadowOpacity = 0.3
        destextView.layer.masksToBounds = true
        destextView.clipsToBounds = true
        
        
        StadiumView.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        StadiumView.layer.shadowRadius = 5
        StadiumView.layer.shadowOpacity = 0.3
        StadiumView.layer.masksToBounds = false
        StadiumView.clipsToBounds = false
        
        
        
        
        countryView.layer.shadowOffset = CGSize(width: 10,height: 10)
        countryView.layer.shadowRadius = 5
        countryView.layer.shadowOpacity = 0.3
        countryView.layer.masksToBounds = false
        countryView.clipsToBounds = false
    }
    
    
    
    //MARK:- Assign the data to the view for viewing
    func presentDataOnTheUI(){
        //MARK:-assigning defaul value
        let obj = TeamsClass()
        obj.idTeam = "3"
        obj.strCountry = "Egypt"
        obj.strDescriptionEN = ""
        obj.strFacebook = "facebook.com"
        obj.strStadium = "stad alqahera"
        obj.strStadiumThumb = "sorat al mal3b"
        obj.strTeam = "Egption Team"
        obj.strTeamLogo = "logo"
        obj.strTeamShort = "Egy"
        obj.strYoutube = "youtube.com"
        
        
        //MARK:-viewing in the api
        
        AbreviationLabel.text = obj.strTeamShort
        CountryNameLabel.text = obj.strCountry
        StadiumNameLabel.text = obj.strStadium
        StadiumImage.image = UIImage(named: "stadium")
        TeamLogoImageView.image = UIImage(named: "Egypt")
    }


}
