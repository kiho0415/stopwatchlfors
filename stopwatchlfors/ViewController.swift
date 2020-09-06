//
//  ViewController.swift
//  stopwatchlfors
//
//  Created by 森田貴帆 on 2020/09/06.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteilabel: UILabel!
    var count: Float = 0.0
    var timer:Timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
        
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.00
        label.text = String(0.0)
        hanteilabel.text = String("")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
        hanteilabel.text = String("")
    }

    @objc func hantei(){
        if count >= 9.8 && count <= 10.2{
            hanteilabel.text = "PERFECT!"
            hanteilabel.textColor = UIColor.red
        }else if count >= 9.7 && count <= 10.3{
            hanteilabel.text = "GREAT"
            hanteilabel.textColor = UIColor.red
        }else if count >= 9.5 && count <= 10.5{
            hanteilabel.text = "GOOD"
            hanteilabel.textColor = UIColor.red
        }else{
            hanteilabel.text = "BAD"
            hanteilabel.textColor = UIColor.blue
        }
    }
}

