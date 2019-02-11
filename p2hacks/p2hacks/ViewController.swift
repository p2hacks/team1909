//
//  ViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/11.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit

var list: String = ""

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var TODO = [list]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
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
    

    

}

