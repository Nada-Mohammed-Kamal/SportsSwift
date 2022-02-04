//
//  RecentEvents.swift
//  SportsApp
//
//  Created by nada elmasry on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation

class RecentEvents : Codable{

    var strEvent :String?
    var idLeague : String?
    var intHomeScore : String?
    var intAwayScore : String?
    var dateEventLocal : String?
    var strTimeLocal : String?
    var idHomeTeam : String?
    var idAwayTeam: String?
    var strStatus : String?
}

class AllEventsFromAPI: Codable {
    var events : [RecentEvents]?
}


