//
//  SportsPresenter.swift
//  SportsApp
//
//  Created by tasnem on 2/2/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import Foundation
protocol SportsPresenterProtocal : AnyObject{
    func loadDataSuccessfully(sports: [Sports])
}

class SportsPresenter{

    var NetworkSPortSer: AllSportsAPIProtocol //= AllSportsAPI()
    weak var view: SportsPresenterProtocal?

    
    init(NetworkSPortSer : AllSportsAPIProtocol ,view: SportsPresenterProtocal ){
        self.NetworkSPortSer = NetworkSPortSer
        self.view = view
    }
    
  
    func getItems(){
        NetworkSPortSer.getAllSports { [weak self] (result) in
               switch result {
                   case .success(let response):
                    self?.view!.loadDataSuccessfully(sports: response!.sports)
                    // self?.sports = response!.sports
                   //  self.collectionView.reloadData()
                    case .failure(let error):
                       print(error.localizedRecoverySuggestion ?? "no error Returned")
                       print("noo")
                       }
                   }

    }
}
