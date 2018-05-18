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
        moodModel.loadMoods()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func saveMood(_ moodDataObject: MoodDataObject) {
        moodModel.addMood(moodDataObject)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MoodDetailViewController {
            destinationVC.rootVC = self
        }
    }

    @IBAction func addMood(_ sender: UIButton) {
        //not here --> also triggers Segue to detail view.
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moodModel.getMoods().count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoodCell", for: indexPath) as! MoodCell
        
        let moodDataObject = moodModel.getMoods()[indexPath.item]
        cell.score.text = String(moodDataObject.overall)
        cell.date.text = Date().description // TODO: Figure this out.
        cell.backgroundColor = UIColor.gray
        cell.layer.cornerRadius = 10
        
        return cell
        
    }
    
    
    
    

}
