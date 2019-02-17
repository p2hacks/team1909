//
//  MyProSetViewController.swift
//  p2hacks
//
//  Created by 津田忠範 on 2019/02/16.
//  Copyright © 2019 たけにい. All rights reserved.
//

import UIKit
import Firebase

class MyProSetViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet var compButton: UIButton!
    @IBOutlet var nameText:UITextField!
    @IBOutlet var belongText:UITextField!
    @IBOutlet var tellText:UITextField!
    @IBOutlet var mailText:UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var Button: UIButton!
    @IBOutlet weak var QRImageView: UIImageView!
    var image1:UIImage!
    var DBRef:DatabaseReference!
    var uuid: String! = UserDefaults.standard.string(forKey: "uuid")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBRef = Database.database().reference()
        compButton.isHidden = true
        nameText.isEnabled = false
        belongText.isEnabled = false
        tellText.isEnabled = false
        mailText.isEnabled = false
        backButton.isEnabled = true
        nameText.delegate = self 
        belongText.delegate = self
        tellText.delegate = self
        mailText.delegate = self
        
        
        let getName = DBRef.child(uuid+"/name/name")
        getName.observe(.value){(snap: DataSnapshot)in self.nameText.text = (snap.value! as AnyObject).description}
        let getBelong = DBRef.child(uuid+"/belong/belong")
        getBelong.observe(.value){(snap: DataSnapshot)in self.belongText.text = (snap.value! as AnyObject).description}
        let getMail = DBRef.child(uuid+"/mail/mail")
        getMail.observe(.value){(snap: DataSnapshot)in self.mailText.text = (snap.value! as AnyObject).description}
        let getTell = DBRef.child(uuid+"/tell/tell")
        getTell.observe(.value){(snap: DataSnapshot)in self.tellText.text = (snap.value! as AnyObject).description}
        
        imageView.image = image1
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2.0
        
        let data = uuid.data(using: String.Encoding.utf8)!
        
        //URLをNSDataに変換し、QRコードを作成します。
        //Converts a url to NSData.
        //let url = "http://swiswiswift.com"
        //let data = url.data(using: String.Encoding.utf8)!
        
        //QRコードを生成します。
        //Generate QR code.
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        //let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let transTrans = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: transTrans)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        //作成したQRコードを表示します
        //Display QR code
//        let qrImageView = UIImageView()
//        qrImageView.contentMode = .scaleAspectFit
//        qrImageView.transform = sizeTransform
//        qrImageView.transform = transTrans
//        qrImageView.frame = self.view.frame
//        qrImageView.image = uiImage
//        self.view.addSubview(qrImageView)
        QRImageView.image = uiImage
    
    }
    
    //CameraViewControllerからの画像の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController2" {//ProViewControllerへ遷移する場合
            
        }
        if segue.identifier == "toCameraViewController" {
            let cameraViewController = segue.destination as! CameraViewController
            cameraViewController.image2 = imageView.image
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func imageButton(){
        performSegue(withIdentifier: "toCameraViewController",sender: nil)
    }
    
    @IBAction func myEdit(){
        compButton.isHidden = false
        nameText.isEnabled = true
        belongText.isEnabled = true
        tellText.isEnabled = true
        mailText.isEnabled = true
        backButton.isEnabled = false
    }
    
    @IBAction func comp(){
        let dataName = ["name":nameText.text!]
        let dataBelong = ["belong":belongText.text!]
        let dataMail = ["mail":mailText.text!]
        let dataTell = ["tell":tellText.text!]
        DBRef.child(uuid+"/name").setValue(dataName)
        DBRef.child(uuid+"/belong").setValue(dataBelong)
        DBRef.child(uuid+"/mail").setValue(dataMail)
        DBRef.child(uuid+"/tell").setValue(dataTell)
        compButton.isHidden = true
        nameText.isEnabled = false
        belongText.isEnabled = false
        tellText.isEnabled = false
        mailText.isEnabled = false
        backButton.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
}
