//
//  LeaguesTableViewCell.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
   // var presCell : UIViewController?
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

        if(leagueCell?.strYoutube == "" ){
            let alart=UIAlertController(title: "Alart", message: "Link is not Avilabel", preferredStyle: .alert)
             alart.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
          UIApplication.shared.keyWindow?.rootViewController?.present(alart,animated: true,completion: nil)
                        return
       }else{

           let appURL = NSURL(string: "youtube://"+leagueCell!.strYoutube!)!
           let webURL = NSURL(string: "https://"+leagueCell!.strYoutube!)!
           let application = UIApplication.shared
           
           if application.canOpenURL(appURL as URL) {

               application.open(appURL as URL)

           } else {

              application.open(webURL as URL)
           }
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
