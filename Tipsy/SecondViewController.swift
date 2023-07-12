//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Molindu Achintha on 2023-07-12.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var onePersonBill = 0.0
    var splitsVC = 0
    var tipVC = 0

    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var secondText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        text.text = String(round(onePersonBill * 100) / 100.0)
        secondText.text = "Split between \(splitsVC) people, with \(tipVC)% tip."
    }
    

    @IBAction func reCalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
