//
//  LastResultsModel.swift
//  SportsApp
//
//  Created by nada elmasry on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit

class LastResultsModel: UICollectionViewCell {
    
    //MARK: IBOutlets
    
    
    @IBOutlet weak var FirstTeamImageView: UIImageView!
    
    @IBOutlet weak var FirstTeamNameLabel: UILabel!
    @IBOutlet weak var SecondTeamImageView: UIImageView!
    
    @IBOutlet weak var SecondTeamNameLabel: UILabel!
    @IBOutlet weak var DateOfTheCompetorsMatchLabel: UILabel!
    @IBOutlet weak var TimeOfTheCompetotersMatchLabel: UILabel!
    @IBOutlet weak var ResultOfTheMatchLabel: UILabel!
}
