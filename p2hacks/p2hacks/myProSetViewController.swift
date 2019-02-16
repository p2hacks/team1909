//
//  MyProSetViewController.swift
//  p2hacks
//
//  Created by 津田忠範 on 2019/02/16.
//  Copyright © 2019 たけにい. All rights reserved.
//

import UIKit

class MyProSetViewController: UIViewController ,UITextFieldDelegate{
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
        nameText.delegate = self 
        belongText.delegate = self
        tellText.delegate = self
        mailText.delegate = self    }
    
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
}
