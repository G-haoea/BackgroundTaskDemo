//
//  ViewController.swift
//  background
//
//  Created by Grace Liu on 26/07/2020.
//  Copyright © 2020 Grace Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var i = 0
    
    //True: continue running after entered background
    //False: does not continue running after entered background
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Create a timer
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.tickDown), userInfo: nil, repeats: true)
        
    }
    
    //Show running state in console
    @objc func tickDown(){
        i += 1
        print(i)
    }


}

