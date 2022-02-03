//
//  Sports.swift
//  SportsApp
//
//  Created by tasnem on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire
class Sports : Decodable{
    var idSport : String?
    var strSport : String?
    var strFormat: String?
    var strSportThumb : String?
    var strSportIconGreen : String?
    var strSportDescription : String?
   
}

class AllSports : Decodable{
    var sports : [Sports]
}
