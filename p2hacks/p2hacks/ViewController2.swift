//
//  ViewController2.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var TODO = ["運営"]
    var text = ""
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TODO.append(text)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        TODO.append(text)
        userDefaults.set(TODO, forKey: "TODOlist")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // ProViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toProViewController",sender: nil)
    }
    
//    let getMaxSpeed:[Double] = userDefaults.array(forKey: "udMaxSpeed") as! [Double]
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toViewController") {
            let _: ViewController = (segue.destination as? ViewController)!
        }
        if (segue.identifier == "toQRReadViewController") {
            let _: QRReadViewController = (segue.destination as? QRReadViewController)!
        }
        if segue.identifier == "toProViewController" {
            let proViewController = segue.destination as! ProViewController
            proViewController.text = self.text
        }
        if segue.identifier == "tomyProViewController" {
            let myproViewController = segue.destination as! myProViewController
            myproViewController.text = self.text
        }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return TODO.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // セルを取得する
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        // セルに表示する値を設定する
//        cell.textLabel!.text = TODO[indexPath.row]
//        return cell
//    }
    
//    override func viewwillAppear(_ animated: Bool) {
//        TODO = UserDefaults.standard.stringArray(forKey: TODO)
//    }
    
}


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


