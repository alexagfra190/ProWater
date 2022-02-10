//
//  ViewControllerReviews.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerReviews: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var reusableNavBar: reusableNavBar!
    @IBOutlet weak var reusableHeader: reusableHeader!
    @IBOutlet weak var btnCameraReviews: UIButton!
    var imageSelectionable : UIImage?
    var idImageView : Int = 4
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnInsta: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableHeader.reusableHeaderTitle.text = "Reviews"
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.btnHomeOnClick))
        
        
    }
    
    @objc func btnHomeOnClick(){
        print("Home reviews")
    }
    
    @IBAction func btnCameraReviewsOnClick(_ sender: Any) {
        showImagePicker(selectedSource: .photoLibrary)
    }
    @IBAction func btnFacebookOnClick(_ sender: Any) {
    }
    
    @IBAction func btnTwitterOnClick(_ sender: Any) {
    }
    @IBAction func btnInstaOnClick(_ sender: Any) {
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
    
    func openPhoto(selection: String){
        //seleccionable=selection
        performSegue(withIdentifier: "ReviewsToPhotoReviewsSegue", sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage{
            imageSelectionable = selectedImage
            
            Client.evidences.array_reviews.append(selectedImage)
            //print(Client.evidences.array_reviews)
            //picker.dismiss(animated: true, completion: nil)
            openPhoto(selection: "camara")
           // picker.dismiss(animated: true, completion: nil)
            
        }else{
            print("Image not found")
        }
       picker.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerReviewsPhoto{
            destino.imageSelectioned = imageSelectionable
            destino.idImageView = idImageView
        }
    }}
