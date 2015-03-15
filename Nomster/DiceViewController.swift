//
//  DiceViewController.swift
//  Nomster
//
//  Created by Tobias Scholze on 13.03.15.
//  Copyright (c) 2015 Tobias Scholze. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    
    let pickerData: [Int] = [2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbarHidden = true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            
            let index = pickerView.selectedRowInComponent(0)
            let countItems = pickerData[index]
            let randomGeneratedValue = Int(rand())
            let randomValue =  Int(rand()) % (countItems)
            
            var alert = UIAlertController(title: "Random", message: "You should take #\(randomValue + 1)",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                self.performSegueWithIdentifier("backToList", sender: alert)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPickerViewDelegate
extension DiceViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return (pickerData[row] as NSNumber).stringValue
    }
}

// MARK: - UIPickerViewDataSource
extension DiceViewController: UIPickerViewDataSource {
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}
