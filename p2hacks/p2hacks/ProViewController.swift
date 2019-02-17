//
//  ProViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseStorage

class ProViewController: UIViewController {
  
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var belongLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    @IBOutlet weak var Proimageview: UIImageView!
    
    var DBRef:DatabaseReference!
    
    var text = "" //遷移で送られてきた値の保存用の変数
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBRef = Database.database().reference()
        nameText = text
        // Do any additional setup after loading the view.
        let getName = DBRef.child(String(nameText)+"/name/name")
        getName.observe(.value){(snap: DataSnapshot)in self.nameLabel.text = (snap.value! as AnyObject).description}
        let getBelong = DBRef.child(String(nameText)+"/belong/belong")
        getBelong.observe(.value){(snap: DataSnapshot)in self.belongLabel.text = (snap.value! as AnyObject).description}
        let getMail = DBRef.child(String(nameText)+"/mail/mail")
        getMail.observe(.value){(snap: DataSnapshot)in self.mailLabel.text = (snap.value! as AnyObject).description}
        let getTell = DBRef.child(String(nameText)+"/tell/tell")
        getTell.observe(.value){(snap: DataSnapshot)in self.tellLabel.text = (snap.value! as AnyObject).description}
        let storage = Storage.storage()
        let storageRef = storage.reference()
        // CGImageRefeference to the file you want to download
        let islandRef = storageRef.child(String(nameText) + "/" + "1.jpg")
        print(islandRef)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                
                self.Proimageview.image = image
            }
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
    //    func createQRCode(message: String, correctionLevel: String = "M", moduleSize: CGFloat = 1) -> UIImage {
    //
    //        let dat = message.data(using: String.Encoding.utf8)!
    //
    //        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: [
    //            "inputMessage": dat,
    //            "inputCorrectionLevel": correctionLevel,
    //            ])!
    //
    //        // moduleSize でリサイズ
    //        let sizeTransform = CGAffineTransform(scaleX: moduleSize, y: moduleSize)
    //        let ciImg = qr.outputImage!.transformed(by: sizeTransform)
    //
    //        return UIImage(ciImage: ciImg, scale: 1, orientation: .up)
    //    }
    //
    //    @IBAction func QR(){
    //        createQRCode(message: "https://www.google.co.jp",moduleSize: 3)
    //    }
    //
    // Segue 準備
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    //        if (segue.identifier == "toViewController") {
    //            let _: ViewController = (segue.destination as? ViewController)!
    //        }
    //    }
}

