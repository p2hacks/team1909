//
//  ProViewController.swift
//  p2hacks
//
//  Created by たけにい on 2019/02/14.
//  Copyright © 2019年 たけにい. All rights reserved.
//

import UIKit
class ProViewController: UIViewController {
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var belongLabel:UILabel!
    @IBOutlet var tellLabel:UILabel!
    @IBOutlet var mailLabel:UILabel!
    
    var text = ""
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

