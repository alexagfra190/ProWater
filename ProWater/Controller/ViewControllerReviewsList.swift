//
//  ViewControllerReviewsList.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerReviewsList: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var reusableHeader: reusableHeader!
    @IBOutlet weak var btnOpenCameraReviews: UIButton!
    @IBOutlet weak var btnAcceptList: UIButton!
    @IBOutlet weak var imageViewList1: UIImageView!
    @IBOutlet weak var imageViewList2: UIImageView!
    @IBOutlet weak var imageViewList3: UIImageView!
    var imageSelectionable : UIImage?
    var idImageView : Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        asignOnCLick()
    
        if Client.evidences.array_reviews.count >= 3{
            btnOpenCameraReviews.isHidden = true
            
        }else{
            btnOpenCameraReviews.isHidden = false
            
        }
        reusableHeader.reusableHeaderTitle.text = "Reviews"
        
    }
    
    @objc func imageEvidenceOnClick1(){
        print("CLICK1")
    
        if imageViewList1.image != nil{
            idImageView = 0
            imageSelectionable = Client.evidences.array_reviews[0]
            performSegue(withIdentifier: "ReviewsListToPhoto", sender: self)
            
        }else{
            print("dont have image")
        }
    }
    
    @objc func imageEvidenceOnClick2(){
        print("CLICK1")
    
        if imageViewList2.image != nil{
            idImageView = 1
            imageSelectionable = Client.evidences.array_reviews[1]
            performSegue(withIdentifier: "ReviewsListToPhoto", sender: self)
            
        }else{
            print("dont have image")
        }
    }

    @objc func imageEvidenceOnClick3(){
        print("CLICK1")
    
        if imageViewList3.image != nil{
            idImageView = 2
            imageSelectionable = Client.evidences.array_reviews[2]
            performSegue(withIdentifier: "ReviewsListToPhoto", sender: self)
            
        }else{
            print("dont have image")
        }
    }

    @IBAction func btnOpenCameraReviewsOnClick(_ sender: Any) {
        showImagePicker(selectedSource: .photoLibrary)
    }
    
    @IBAction func btnAcceptListOnClick(_ sender: Any) {
    }
    
    
    func loadImages(){
        let arrayEvidences = Client.evidences.array_reviews
        print(arrayEvidences)
        imageViewList1.image = arrayEvidences[0]
        if arrayEvidences.indices.contains(1){
            imageViewList2.image = arrayEvidences[1]
        }
        if arrayEvidences.indices.contains(2){
            imageViewList3.image = arrayEvidences[2]
        }
        
    }
    
    func asignOnCLick(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick1))
        imageViewList1.addGestureRecognizer(tap)
        imageViewList1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick2))
        imageViewList2.addGestureRecognizer(tap2)
        imageViewList2.isUserInteractionEnabled = true
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick3))
        imageViewList3.addGestureRecognizer(tap3)
        imageViewList3.isUserInteractionEnabled = true
        
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
        performSegue(withIdentifier: "ReviewsListToPhoto", sender: self)
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
    }
    
}
