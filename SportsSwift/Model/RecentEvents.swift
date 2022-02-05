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
    var strHomeTeam : String?
    var strAwayTeam : String?
    var strTimestamp : String?
    
    var dateSubstring : String?
    var daySubString : String?
    
    func convertStringToDate(str : String) -> Date{
        let isoDate = str
        print(str)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: isoDate) else { return Date() }
        print(date)
        return date
    }
    
    
    func getDateAndTimeFromTimeStamp(){
        dateSubstring = String(self.strTimestamp?.prefix(10) ?? "")
        daySubString = String(self.strTimestamp?.suffix(14) ?? "")
    }
    
 }

class AllEventsFromAPI: Codable {
    var events : [RecentEvents]?
}

