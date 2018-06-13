//
//  ExtendedActivityDefinition.swift
//  Therapy Helper
//
//  Created by Andreas on 12.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import FHIR

class ExtendedActivityDefinition: ActivityDefinition {
    
    
    var timer_minutes: FHIRInteger?
    
    var patient_ID: FHIRInteger?
    
    var suitableMood: MoodDataObject?
    
}
