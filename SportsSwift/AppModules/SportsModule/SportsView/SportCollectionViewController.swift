//
//  SportCollectionViewController.swift
//  SportsApp
//
//  Created by tasnem on 1/29/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import Kingfisher



private let reuseIdentifier = "Cell"

class SportCollectionViewController: UICollectionViewController {
    
    let NetworkSPortSer: AllSportsAPIProtocol = AllSportsAPI()
    var sportPresenter : SportsPresenter!
    var sports = [Sports]()
 

    override func viewDidLoad() {
        if Reachability.isConnectedToNetwork(){
            self.title = "Sports"
          sportPresenter = SportsPresenter(NetworkSPortSer: NetworkSPortSer, view: self)
          sportPresenter.getItems()
        }else{
            let alart=UIAlertController(title: "Alart", message: "pleace check your conectivity and try again", preferredStyle: .alert)
             alart.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
             self.present(alart,animated: true,completion: nil)
        }
    }

     
    

   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! custemCollectionViewCell
    
        cell.myView.backgroundColor = UIColor(white: 1, alpha: 0.5)
      
          cell.SportImage.kf.setImage(with: URL(string: sports[indexPath.row].strSportThumb ?? "photo"))
        cell.SportNameLabel.text = sports[indexPath.row].strSport
        cell.contentView.makeCorner(withRadius: 20.0)
            
        return cell
    }

  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
           let sport = sports[indexPath.row]
    
          let LeageTVC = self.storyboard?.instantiateViewController(identifier: "LeaguesTableViewController") as! LeaguesTableViewController
              LeageTVC.sport = sport
   

          self.navigationController?.pushViewController(LeageTVC, animated: true)


     }

}
extension SportCollectionViewController: UICollectionViewDelegateFlowLayout ,  SportsPresenterProtocal{
    func loadDataSuccessfully(sports: [Sports]) {
         self.sports = sports
        self.collectionView.reloadData()
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width:(UIScreen.main.bounds.size.width - 10)/2, height: (UIScreen.main.bounds.size.height)/4)
    }
}
