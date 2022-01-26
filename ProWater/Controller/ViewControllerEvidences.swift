//
//  ViewControllerEvidences.swift
//  ProWater
//
//  Created by user188472 on 1/24/22.
//

import UIKit
import SwiftUI



class ViewControllerEvidences: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imgPreview: UIImageView!
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_navBack: UIButton!
   
    @IBOutlet weak var btn_navNext: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnGalery: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("comienzo")
        configureSVG()

    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btnCamera.svgCamera()
        btnGalery.svgGalery()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        //btn_navHome.isHidden = true
        btn_navBack.isHidden = true
        btn_navNext.isHidden = true
        
    }
    @IBAction func openCamera(_ sender: Any) {
        print("Camera")
        showImagePicker(selectedSource: .camera)
    }
    
    @IBAction func openGalery(_ sender: Any) {
        print("Galeria")
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
            imgPreview.image = selectedImage
        }else{
            print("Image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
