//
//  ViewController2.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var TODO = ["大学","サークル","バイト"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toViewController",sender: nil)
    }
    
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toViewController") {
            let _: ViewController = (segue.destination as? ViewController)!
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


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


