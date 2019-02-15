//
//  AddListViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit
import Firebase

class AddListViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet weak var searchResult: UILabel!
    
    var DBRef:DatabaseReference!
    
    // 文字列保存用の変数
    var textFieldString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBRef = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ok() {
        textFieldString = textField.text!
        let getName = DBRef.child(String(textFieldString)+"/belong/belong")
        getName.observe(.value){(snap: DataSnapshot)in self.searchResult.text = (snap.value! as AnyObject).description}
        textFieldString = ""
        // SubViewController へ遷移するために Segue を呼び出す
        //performSegue(withIdentifier: "toViewController2",sender: nil)
    }
    
    @IBAction func cancel() {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toViewController2",sender: nil)
    }
    
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toViewController2") {
            let _: ViewController2 = (segue.destination as? ViewController2)!
        }
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
