//
//  ViewControllerPhoto.swift
//  ProWater
//
//  Created by user188472 on 1/31/22.
//

import UIKit

class ViewControllerPhoto: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var btnCancelImage: UIButton!
    @IBOutlet weak var btnAcceptImage: UIButton!
    @IBOutlet weak var headerReusable: reusableHeader!
    var seleccion : String?
    @IBOutlet weak var imgPreview: UIImageView!
    var imageSelectioned : UIImage?
    var idImageView : Int = 7

    override func viewDidLoad() {
        super.viewDidLoad()
        headerReusable.reusableHeaderTitle.text = "Preview"
        imgPreview.image = imageSelectioned

    }
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType){
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else{
            print("not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = true
        
        
        self.present(imagePickerController,animated: true,completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage{
            imgPreview.image = selectedImage
            
        }else{
            print("Image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCancelOnClick(_ sender: Any) {
        
        if idImageView==7 {
            Client.evidences.array_evidences.removeLast()
        }else{
            Client.evidences.array_evidences.remove(at: (idImageView))
        }
        if Client.evidences.array_evidences.count > 0 {
            performSegue(withIdentifier: "PreviewToListSegue", sender: self)
            
        }else{
            performSegue(withIdentifier: "PreviewToEvidencesSegue", sender: self)
            
        }
    }
    
    
    @IBAction func btnAcceptImageOnClick(_ sender: Any) {
        performSegue(withIdentifier: "PreviewToListSegue", sender: self)
    }
    
}
