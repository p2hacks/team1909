//
//  myProViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/16.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

class myProViewController: UIViewController {

    var text = "" //遷移で得られるテキストの保存用の変数
    var nameText = ""
    
    @IBAction func myProSet(){
        // ProViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "tomyProSetViewController",sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "tomyProViewController" {
            let myprosetViewController = segue.destination as! myProViewController
            myprosetViewController.text = self.text
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // nameTextに送られてきた名前を保存
        nameText = text
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
