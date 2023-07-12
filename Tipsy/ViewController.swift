//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tip = 0
    var bill = 0.0
    
    var brain = TipsyBrain()
    
    @IBOutlet weak var totalBill: UITextField!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var tenBtn: UIButton!
    @IBOutlet weak var twentyBtn: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.value = 2.0
        
        reUpdateTip()
        
        zeroBtn.backgroundColor = nil
        tenBtn.backgroundColor = nil
        twentyBtn.backgroundColor = nil
        
        tenBtn.tintColor = nil
        
    }

    @IBAction func textEntered(_ sender: UITextField) {
    }
    
    
    @IBAction func tipSelected(_ sender: UIButton) {
        updateTip()
        
        let red = 0
        let green = 176
        let blue = 107

        sender.backgroundColor = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
        reUpdateTip()
        sender.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        
        var str = sender.currentTitle!
        let startIndex = str.index(str.startIndex, offsetBy: 0)
        let endIndex = str.index(str.startIndex, offsetBy: str.count - 2)
        let slicedString = str[startIndex...endIndex]
        tip = Int(slicedString)!
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        bill = Double(totalBill.text!)!
        brain.calculateTip(split: Int(stepperLabel.text!)!, bill: bill, tip: tip)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    @IBAction func Stepper(_ sender: UIStepper) {
        stepperLabel.text = String(Int(stepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            var secondVC = segue.destination as! SecondViewController
            secondVC.onePersonBill = brain.getOnePersonBill()
            secondVC.tipVC = tip
            secondVC.splitsVC = Int(stepperLabel.text!)!
        }
    }
    
    func updateTip(){
        zeroBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        tenBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        twentyBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        zeroBtn.backgroundColor = nil
        tenBtn.backgroundColor = nil
        twentyBtn.backgroundColor = nil

    }
    
    func reUpdateTip(){
        let red = 0
        let green = 176
        let blue = 107

        var color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
        
        zeroBtn.setTitleColor(color, for: UIControl.State.normal)
        tenBtn.setTitleColor(color, for: UIControl.State.normal)
        twentyBtn.setTitleColor(color, for: UIControl.State.normal)

    }
}

