//
//  MoodsViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 28.04.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class MoodsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var moodModel: MoodModel = MoodModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMood(_ sender: UIButton) {
        print("Button Pushed")
        collectionView.reloadData()
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moodModel.getMoods().count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoodCell", for: indexPath)
        
        return cell
        
    }
    
    
    
    

}
