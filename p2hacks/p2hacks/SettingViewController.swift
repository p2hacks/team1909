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

class SettingViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var belongField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var tellField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    
    var DBRef:DatabaseReference!
    
    let uuid = NSUUID().uuidString // IDを生成
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     DBRef = Database.database().reference()
        // Do any additional setup after loading the view.
        nameField.delegate = self
        belongField.delegate = self
        tellField.delegate = self
        mailField.delegate = self
        
       
  //  override func viewWillAppear(_ animated: Bool) {
  //      super.viewWillAppear(true)
  //      }
   }
    
    @IBAction func idregister(_ sender: Any) {
        
        let dataName = ["name":nameField.text!]
        let dataBelong = ["belong":belongField.text!]
        let dataMail = ["mail":mailField.text!]
        let dataTell = ["tell":tellField.text!]
       
        DBRef.child(uuid+"/name").setValue(dataName)
        DBRef.child(uuid+"/belong").setValue(dataBelong)
        DBRef.child(uuid+"/mail").setValue(dataMail)
        DBRef.child(uuid+"/tell").setValue(dataTell)
    
        UserDefaults.standard.set(uuid, forKey: "uuid")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
            let next = segue.destination as! ViewController2
            //ViewController2へ選択された名前をテキストで渡す
        let _ = next.view
           next.uuid  = self.uuid
        }
}

