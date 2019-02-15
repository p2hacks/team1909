//
//  AddListViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    // 文字列保存用の変数
    var textFieldString = ""
    
    
    @IBAction func ok() {
        textFieldString = textField.text!
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toViewController",sender: nil)
    }
    
    @IBAction func cancel() {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toViewController") {
            let _: ViewController = (segue.destination as? ViewController)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.placeholder = "ここに入力してくださいね"
        // Do any additional setup after loading the view.
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
