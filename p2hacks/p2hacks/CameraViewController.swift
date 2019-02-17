import UIKit
import Firebase

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image2:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image2
        label.text = "Tap the [Start] to take a picture"
        
    }
    
    // カメラの撮影開始
    @IBAction func camera() {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            let image:UIImage! = imageView.image
            
            if image != nil {
                UIImageWriteToSavedPhotosAlbum(
                    image,
                    self,
                    #selector(CameraViewController.image(_:didFinishSavingWithError:contextInfo:)),
                    nil)
            }
            else{
                label.text = "image Failed !"
            }
            
            
        }
        else{
            label.text = "error"
            
        }
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let pickedImage = info[.originalImage]
            as? UIImage {
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
    }
    
    
    // 写真をプロフィール画面に設定
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var myProSetViewController = segue.destination as! MyProSetViewController
        myProSetViewController.image1 = imageView.image
        
    }
    
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "Save Succeeded"
        }
    }
    
    // アルバムを表示
    @IBAction func album(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
            
        }
        
    }
    
    
//    @IBAction func back() {
//            // toViewController2 へ遷移するために Segue を呼び出す
//            performSegue(withIdentifier: "tomyProSetViewController",sender: nil)
//
//
//    }
    
}
