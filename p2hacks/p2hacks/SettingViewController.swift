//
//  SettingViewController.swift
//  p2hacks
//
//  Created by 津田忠範 on 2019/02/15.
//  Copyright © 2019 たけにい. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore

class SettingViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var belongField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var tellField: UITextField!
    
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   DBRef = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func idregister(_ sender: Any) {
        let dataName = ["name":nameField.text!]
        let dataBelong = ["belong":belongField.text!]
        let dataMail = ["mail":mailField.text!]
        let dataTell = ["tell":tellField.text!]
        DBRef.child(String(nameField.text!)+"/name").setValue(dataName)
        DBRef.child(String(nameField.text!)+"/belong").setValue(dataBelong)
        DBRef.child(String(nameField.text!)+"/mail").setValue(dataMail)
        DBRef.child(String(nameField.text!)+"/tell").setValue(dataTell)
        
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
