//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Molindu Achintha on 2023-07-12.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

class TipsyBrain{
    var onePersonBill: Double?
    
    func calculateTip(split: Int, bill: Double, tip: Int){
        onePersonBill = (bill + bill * Double(tip) / 100.0) / Double(split)
    }
    
    func getOnePersonBill() -> Double{
        return onePersonBill ?? 0.0
    }
}
