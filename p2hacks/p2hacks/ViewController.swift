//
//  ViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/11.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var TODO = ["あほ","ばか","まぬけ"]
    @IBAction func QRbutton(){
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toProViewController",sender: nil)
    }
    
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toProViewController") {
            let _: ProViewController = (segue.destination as? ProViewController)!
        }
        if (segue.identifier == "toQRReadViewController") {
            let _: QRReadViewController = (segue.destination as? QRReadViewController)!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = TODO[indexPath.row]
        return cell
    }
    
    
    
    
}

