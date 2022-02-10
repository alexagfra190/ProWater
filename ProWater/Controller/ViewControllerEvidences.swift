//
//  ViewControllerEvidences.swift
//  ProWater
//
//  Created by user188472 on 1/24/22.
//

import UIKit
import SwiftUI



class ViewControllerEvidences: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var headerContainer: UIView!
    let evidences = Seller()
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
   
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnGalery: UIButton!
    var seleccionable : String = ""
    var imageSelectionable : UIImage?
    
    
    @IBOutlet weak var reusableHeader: reusableHeader!
    
    
    let header : HeaderContainer? = nil
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("comienzo")
        
        UserDefaults.standard.setValue("UNO", forKey: "title")
        reusableHeader.reusableHeaderTitle.text = "Evidences"
        //header.changeTitle(title: "UNO")
    }
    
    func openPhoto(selection: String){
        seleccionable=selection
        performSegue(withIdentifier: "VCPhotoSegue", sender: self)
    }

    @IBAction func openCamera(_ sender: Any) {
        print("Camera")
        //openPhoto(selection: "camara")
        showImagePicker(selectedSource: .camera)
    }
    
    @IBAction func openGalery(_ sender: Any) {
        print("Galeria")
        //openPhoto(selection: "galeria")
        showImagePicker(selectedSource: .photoLibrary)
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
            imageSelectionable = selectedImage
            
            Client.evidences.array_evidences.append(selectedImage)
            print(Client.evidences.array_evidences)
            openPhoto(selection: "camara")
            
        }else{
            print("Image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerPhoto{
            destino.imageSelectioned = imageSelectionable
        }
    }
}
