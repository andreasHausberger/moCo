//
//  ChallengesViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 28.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//


import UIKit
import CoreData
import FHIR

class ChallengesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let challengeModel = ChallengeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        addTestChallenge();
        challengeModel.loadChallenges();
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return challengeModel.getChallenges().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeCell", for: indexPath) as! ChallengeCell
        if (!challengeModel.getChallenges().isEmpty) {
            
            let challenge = challengeModel.getChallenges()[indexPath.item]
            cell.configureContent(from: challenge)
            
            cell.layer.cornerRadius = 10
            cell.backgroundColor = UIColor.lightGray
            
            
        }
        return cell
    }
    
    
    
    
    
    
    
    
    func addTestChallenge() {
        
        let chTitle = "TestTitle"
        let chText = "Test text text text text"
        let chCounterCurrent = 0 as Int64
        let chCounterTotal = 0 as Int64
        let chCreationDate = Date()
        
        let newChallengeDataObject = ChallengeDataObject(title: chTitle, text: chText, counterTotal: chCounterTotal, counterCurrent: chCounterCurrent, creationDate: chCreationDate)
        self.challengeModel.addChallenge(newChallengeDataObject)
        self.collectionView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    
    
}
