//
//  LeagueVC+CollectionView.swift
//  SportsApp
//
//  Created by nada elmasry on 1/31/22.
//  Copyright © 2022 nada elmasry. All rights reserved.
//

import UIKit
import Foundation

extension LeagueDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    //MARK: setUP CollectionView Delegation
    func SetUpCollectionViewDelegation(){
        UpcomingEventsCollectionView.delegate = self
        UpcomingEventsCollectionView.dataSource = self
        
        LatestResultCollectionView.delegate = self
        LatestResultCollectionView.dataSource = self
        
        TeamsCollectionView.delegate = self
        TeamsCollectionView.dataSource = self
    }
    
    //MARK:Collection view Functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == UpcomingEventsCollectionView{
            return 1
        }
            
        else if collectionView == LatestResultCollectionView{
            return leaguePresenterRef.getLatestCount()
        }
        else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == UpcomingEventsCollectionView{
            return leaguePresenterRef.getUpcomingCount()
        }
            
        else if collectionView == LatestResultCollectionView{
            return leaguePresenterRef.getLatestCount()
        }
        else{
            return leaguePresenterRef.getTeamsCount()
        }
    }
    
    func didFetchDataSuccessfully() {
        TeamsCollectionView.reloadData()
        self.spinner.stopAnimating()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let EmptyCell : UICollectionViewCell = UICollectionViewCell()
        if collectionView == UpcomingEventsCollectionView{
            let cell : UpcomingEventMoudel = UpcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEventMoudel", for: indexPath) as! UpcomingEventMoudel
            cell.DateOfTheEventLabel.text = leaguePresenterRef.UpcomingEvents[indexPath.row].dateSubstring ?? ""
            cell.EventNameLabel.text = "\(String(describing: leaguePresenterRef.UpcomingEvents[indexPath.row].strAwayTeam ?? "")) vs \(String(describing: leaguePresenterRef.UpcomingEvents[indexPath.row].strHomeTeam ?? ""))"
            cell.EventTimeLabel.text = leaguePresenterRef.UpcomingEvents[indexPath.row].daySubString ?? ""
            cell.UpcomingImageImageView.makeCurved()
            cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.25)
            cell.UpcomingImageImageView.image = UIImage(named: "placeholder")?.alpha(0.9)
            cell.contentView.makeCorner(withRadius: 20.0)
            /*objToCallTheDateFunc.convertStringToDate(str: teamPresenterRef.UpcomingEvents[indexPath.row].dateEventLocal ?? "")*/
            return cell
        }
            
        else if collectionView == LatestResultCollectionView{
            let cell : LastResultsModel = LatestResultCollectionView.dequeueReusableCell(withReuseIdentifier: "LastResultsModel", for: indexPath) as! LastResultsModel
            cell.DateOfTheCompetorsMatchLabel.text = leaguePresenterRef.FinishedEvents[indexPath.row].dateEventLocal ?? ""
            cell.FirstTeamNameLabel.text = leaguePresenterRef.FinishedEvents[indexPath.row].strAwayTeam ?? ""
            cell.SecondTeamNameLabel.text = leaguePresenterRef.FinishedEvents[indexPath.row].strHomeTeam ?? ""
            cell.ResultOfTheMatchLabel.text = "\(String(describing: leaguePresenterRef.FinishedEvents[indexPath.row].intAwayScore ?? "")) : \(String(describing: leaguePresenterRef.FinishedEvents[indexPath.row].intHomeScore ?? ""))"
            cell.FirstTeamImageView.makeRounded()
            cell.SecondTeamImageView.makeRounded()
            cell.TimeOfTheCompetotersMatchLabel.text = leaguePresenterRef.FinishedEvents[indexPath.row].strTimeLocal ?? ""
            //guard let teams = leaguePresenterRef.teams else { return EmptyCell}
            for team in leaguePresenterRef.teams{
                if team.strTeam == leaguePresenterRef.FinishedEvents[indexPath.row].strAwayTeam
                {
                    cell.FirstTeamImageView.kf.setImage(with: URL(string: team.strTeamBadge ?? "") , placeholder: UIImage(named: "PlaceHolder2"))
                }
                
            }
            for team in leaguePresenterRef.teams{
                if team.strTeam == leaguePresenterRef.FinishedEvents[indexPath.row].strHomeTeam
                {
                    cell.SecondTeamImageView.kf.setImage(with: URL(string: team.strTeamBadge ?? "") , placeholder: UIImage(named: "PlaceHolder2"))
                }
            }
            
            cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.25)
            cell.contentView.makeCorner(withRadius: 20.0)
            return cell
        }
        else if collectionView == TeamsCollectionView{
            let cell : TeamsMoudelCell = TeamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsMoudel", for: indexPath) as! TeamsMoudelCell
            cell.TeamImageView.makeRounded()
            print(leaguePresenterRef.teams[indexPath.row].strTeamBadge ?? "no image")
            cell.setTeamImage(imageSTr : leaguePresenterRef.teams[indexPath.row].strTeamBadge ?? "")
            cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.25)
            cell.contentView.makeCorner(withRadius: 20.0)
            return cell
        }
        return EmptyCell
    }
    
    //MARK: resize cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == UpcomingEventsCollectionView{
            return CGSize(width: 369.0, height: 130.0)
        }
        else if collectionView == LatestResultCollectionView
        {
            return CGSize(width: 369.0, height: 230.0)
        }
        else{
            return CGSize(width: 128.0, height: 128.0)
        }
    }
    
    func addingSwipe()
    {
        let swipeRight = UISwipeGestureRecognizer(target: self, action:
            #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == TeamsCollectionView else {return}
        let teamDetailsStoryboard = UIStoryboard(name: "Leages", bundle: nil)
        let teamDetailsVC = teamDetailsStoryboard.instantiateViewController(withIdentifier: "TeamsViewController") as! TeamsDetailsViewController
        teamDetailsVC.teamSelected = leaguePresenterRef.teams[indexPath.row]
        self.present(teamDetailsVC, animated: true, completion: nil)
    }
    
    func didFetchEventSuccessfully() {
        UpcomingEventsCollectionView.reloadData()
        LatestResultCollectionView.reloadData()
    }
    
}
