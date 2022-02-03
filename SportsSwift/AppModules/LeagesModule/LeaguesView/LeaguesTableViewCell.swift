//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var LeagueImage: UIImageView!
    
    @IBOutlet weak var LeagueNameLabel: UILabel!
    
    var leagueCell : League?{
        didSet{
            guard  let leagueCell = leagueCell else {return}
              LeagueImage.layer.cornerRadius = LeagueImage.frame.size.width/2
               LeagueImage.clipsToBounds = true
           
                  LeagueImage.kf.setImage(with: URL(string: leagueCell.strBadge ?? "photo"))
                   LeagueNameLabel.text = leagueCell.strLeague
        }
    }
    
    @IBAction func showLeagueVideo(_ sender: Any) {
        guard  leagueCell!.strYoutube != nil else {
             print("there is no link")
            return
           
        }
        let appURL = NSURL(string: "youtube://"+leagueCell!.strYoutube!)!
           let webURL = NSURL(string: "https://"+leagueCell!.strYoutube!)!
           let application = UIApplication.shared

           if application.canOpenURL(appURL as URL) {
               application.open(appURL as URL)
           } else {
               // if Youtube app is not installed, open URL inside Safari
               application.open(webURL as URL)
           }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
