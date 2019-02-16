//
//  MyProSetViewController.swift
//  p2hacks
//
//  Created by 津田忠範 on 2019/02/16.
//  Copyright © 2019 たけにい. All rights reserved.
//

import UIKit
import Firebase

class MyProSetViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet var compButton: UIButton!
    @IBOutlet var nameText:UITextField!
    @IBOutlet var belongText:UITextField!
    @IBOutlet var tellText:UITextField!
    @IBOutlet var mailText:UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet var Button: UIButton!
    var DBRef:DatabaseReference!
    var uuid: String! = UserDefaults.standard.string(forKey: "uuid")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBRef = Database.database().reference()
        compButton.isHidden = true
        nameText.isEnabled = false
        belongText.isEnabled = false
        tellText.isEnabled = false
        mailText.isEnabled = false
        backButton.isEnabled = true
        nameText.delegate = self 
        belongText.delegate = self
        tellText.delegate = self
        mailText.delegate = self
        
        let getName = DBRef.child(uuid+"/name/name")
        getName.observe(.value){(snap: DataSnapshot)in self.nameText.text = (snap.value! as AnyObject).description}
        let getBelong = DBRef.child(uuid+"/belong/belong")
        getBelong.observe(.value){(snap: DataSnapshot)in self.belongText.text = (snap.value! as AnyObject).description}
        let getMail = DBRef.child(uuid+"/mail/mail")
        getMail.observe(.value){(snap: DataSnapshot)in self.mailText.text = (snap.value! as AnyObject).description}
        let getTell = DBRef.child(uuid+"/tell/tell")
        getTell.observe(.value){(snap: DataSnapshot)in self.tellText.text = (snap.value! as AnyObject).description}
        
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2.0
        
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
        let dataName = ["name":nameText.text!]
        let dataBelong = ["belong":belongText.text!]
        let dataMail = ["mail":mailText.text!]
        let dataTell = ["tell":tellText.text!]
        DBRef.child(uuid+"/name").setValue(dataName)
        DBRef.child(uuid+"/belong").setValue(dataBelong)
        DBRef.child(uuid+"/mail").setValue(dataMail)
        DBRef.child(uuid+"/tell").setValue(dataTell)
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
