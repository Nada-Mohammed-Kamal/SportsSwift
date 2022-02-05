//
//  FavoritesTableViewCell.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var FavoriteImage: UIImageView!
    
    
    @IBOutlet weak var FavoriteNameLabel: UILabel!
    
    @IBAction func showFavoriteVideo(_ sender: Any) {
        
        if(FavouritCell?.strYoutube == "" ){
                  let alart=UIAlertController(title: "Alart", message: "Link is not Avilabel", preferredStyle: .alert)
                   alart.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.present(alart,animated: true,completion: nil)
                              return
             }else{

                 let appURL = NSURL(string: "youtube://"+FavouritCell!.strYoutube!)!
                 let webURL = NSURL(string: "https://"+FavouritCell!.strYoutube!)!
                 let application = UIApplication.shared
                 
                 if application.canOpenURL(appURL as URL) {

                     application.open(appURL as URL)

                 } else {

                    application.open(webURL as URL)
                 }
              }
        
    }
    
    
    
    var FavouritCell : FavouriteLeagues?{
          didSet{
              guard  let FavouritCell = FavouritCell else {return}
              FavoriteImage.layer.cornerRadius = FavoriteImage.frame.size.width/2
              FavoriteImage.clipsToBounds = true
             
                    FavoriteImage.kf.setImage(with: URL(string: FavouritCell.strBadge ?? "photo"))
                    FavoriteNameLabel.text = FavouritCell.strLeague
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
