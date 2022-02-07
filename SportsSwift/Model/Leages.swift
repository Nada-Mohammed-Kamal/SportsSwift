//
//  Leages.swift
//  SportsApp
//
//  Created by tasnem on 2/1/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
import Alamofire


struct League : Codable{

    var idLeague : String?
    var strLeague : String?
    var strYoutube : String?
    var strBadge : String?
    var strLogo : String?
   // init(id : String , name : String , youtube : String , strBadge : String ,strLogo : String) {
   // }
}

class AllLeagues : Codable{
    var countrys : [League]
}


//class leagues : Decodable{
//    var idLeague: String?
//    var strLeague : String?
//    var strSport: String?
//    var strLeagueAlternate : String?
//    var strLogo: String?
//    var strYoutube : String?
//
//}
//
//class AllLeagues : Decodable{
//    var countrys : [leagues]
//}
