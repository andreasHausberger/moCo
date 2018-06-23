//
//  DiaryViewController.swift
//  Therapy Helper
//
//  Created by Josef on 15.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryReviewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var diaryDataObject: DiaryDataObject!
    var diaryModel: DiaryModel?
    
    var list: [DiaryEntryDataObject] = [DiaryEntryDataObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view.
        //challengeModel.loadChallenges();
    
        for i in diaryDataObject.morningActivities {
            i.timeFrame = 0
        }
        for i in diaryDataObject.afternoonActivities {
            i.timeFrame = 1
        }
        for i in diaryDataObject.eveningActivities {
            i.timeFrame = 2
        }
        
        list = diaryDataObject.morningActivities + diaryDataObject.afternoonActivities + diaryDataObject.eveningActivities
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfCells = list.count
        return(numberOfCells)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "DiaryCell")
        
        let text1 = list[indexPath.row].text
        let text2 = " " + list[indexPath.row].emotion_anger!.description + "-"
        let text3 = (list[indexPath.row].emotion_fatigue?.description)! + "-"
        let text4 = (list[indexPath.row].emotion_anger?.description)! + "-"
        let text5 = list[indexPath.row].emotion_worry?.description
        
        let text = text1! + text2 + text3 + text4 + text5!

        cell.textLabel?.text =  text
        
        switch list[indexPath.row].timeFrame {
        case 0:
            cell.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.78, blue: 0, alpha: 0.75)
        case 1:
            cell.backgroundColor = UIColor(displayP3Red: 0.35, green: 0.78, blue: 0.98, alpha: 0.75)
        case 2:
            cell.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
        default:
            cell.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
        }
        
        return(cell)
    
    }
    
    

    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let myString = formatter.string(from: diaryDataObject.startTime)
        
        titleLabel.text = myString
        //textLabel.text = challenge?.text
        //counterLabel.text = (challenge?.counterCurrent.description)! + " / " + (challenge?.counterTotal.description)!
    }
    
    func setUp(diaryDataObject: DiaryDataObject) {
        self.diaryDataObject = diaryDataObject
    }
    
    
    
}
