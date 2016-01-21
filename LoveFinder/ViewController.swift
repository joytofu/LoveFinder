//
//  ViewController.swift
//  LoveFinder
//
//  Created by Kinson Chow on 1/21/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var heightNum: UILabel!
    @IBOutlet weak var hasHouse: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        name.resignFirstResponder()
    }

    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        heightNum.text = "\(Int(slider.value))cm"
    }
    
    
    @IBAction func submit(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "高富帅" : "白富美"
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let now = NSDate()
        
        let components = gregorian?.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue:0))
        
        let age = components?.year
        
        let hasHouseText = hasHouse.on ? "有房" : "没房"
        
        result.text = "\(name.text!),\(age!)岁,\(genderText),身高\(heightNum.text!),\(hasHouseText),求约炮！"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    

}

