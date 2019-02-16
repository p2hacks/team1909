//
//  MyProSetViewController.swift
//  p2hacks
//
//  Created by 津田忠範 on 2019/02/16.
//  Copyright © 2019 たけにい. All rights reserved.
//

import UIKit

class MyProSetViewController: UIViewController {
    @IBOutlet var compButton: UIButton!
    @IBOutlet var nameText:UITextField!
    @IBOutlet var belongText:UITextField!
    @IBOutlet var tellText:UITextField!
    @IBOutlet var mailText:UITextField!
    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compButton.isHidden = true
        nameText.isEnabled = false
        belongText.isEnabled = false
        tellText.isEnabled = false
        mailText.isEnabled = false
        backButton.isEnabled = true
    }
    
    @IBAction func myEdit(){
        compButton.isHidden = false
        nameText.isEnabled = true
        belongText.isEnabled = true
        tellText.isEnabled = true
        mailText.isEnabled = true
        backButton.isEnabled = false
    }
    @IBAction func comp(){
        compButton.isHidden = true
        nameText.isEnabled = false
        belongText.isEnabled = false
        tellText.isEnabled = false
        mailText.isEnabled = false
         backButton.isEnabled = true
        
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
