//
//  TeamsMoudel.swift
//  SportsApp
//
//  Created by nada elmasry on 1/31/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import Kingfisher

class TeamsMoudelCell: UICollectionViewCell {
    
    @IBOutlet weak var TeamImageView: UIImageView!
    
    
    func setTeamImage(imageSTr : String){
        self.TeamImageView.kf.setImage(with: URL(string: imageSTr))
    }
}
