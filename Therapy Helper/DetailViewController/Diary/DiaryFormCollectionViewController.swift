//
//  DiaryFormCollectionViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 02.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryFormCollectionViewController: DiaryFormViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var entries: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
     @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }
    
    func addEntry(_ entry: DiaryEntryDataObject) {
        entries.append(entry)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DiaryEntryViewController {
            destinationVC.previousVC = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryEntryCell", for: indexPath) as! DiaryEntryCell
        let entry = entries[indexPath.item]
        cell.setUp(diaryEntry: entry)
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let parentVC = self.parent as? DiaryDetailViewController {
            switch self.title {
            case "morningViewController":
                parentVC.morningActivities = entries
                return
            case "afternoonViewController":
                parentVC.afternoonActivities = entries
                return
            case "eveningViewController":
                parentVC.eveningActivities = entries
                return
            default:
                return
            }
        }
        
        
    }
}
