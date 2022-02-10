//
//  ViewControllerListEvidences.swift
//  ProWater
//
//  Created by user188472 on 2/1/22.
//

import UIKit

class ViewControllerListEvidences: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var imageSelectionable : UIImage?    //objetos reusables
    @IBOutlet weak var headerReusable: reusableHeader!
    @IBOutlet weak var navBarReusable: reusableNavBar!
    //botones
    @IBOutlet weak var btnGaleria: UIButton!
    @IBOutlet weak var btnCamara: UIButton!
    @IBOutlet weak var btnAcceptEvidences: UIButton!
    
    //contenedor de imagen
    @IBOutlet weak var imageEvidence1: UIImageView!
    @IBOutlet weak var imageEvidence2: UIImageView!
    @IBOutlet weak var imageEvidence3: UIImageView!
    @IBOutlet weak var imageEvidence4: UIImageView!
    @IBOutlet weak var imageEvidence5: UIImageView!
    @IBOutlet weak var imageEvidence6: UIImageView!
    
    var idImageView : Int = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        asignOnCLick()
        loadImages()
        if Client.evidences.array_evidences.count >= 6{
            btnGaleria.isHidden = true
            btnCamara.isHidden = true
        }else{
            btnGaleria.isHidden = false
            btnCamara.isHidden = false
        }
        headerReusable.reusableHeaderTitle.text = "Evidences"
    }
    
    func asignOnCLick(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick1))
        imageEvidence1.addGestureRecognizer(tap)
        imageEvidence1.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick2))
        imageEvidence2.addGestureRecognizer(tap2)
        imageEvidence2.isUserInteractionEnabled = true
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick3))
        imageEvidence3.addGestureRecognizer(tap3)
        imageEvidence3.isUserInteractionEnabled = true
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick4))
        imageEvidence4.addGestureRecognizer(tap4)
        imageEvidence4.isUserInteractionEnabled = true
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick5))
        imageEvidence5.addGestureRecognizer(tap5)
        imageEvidence5.isUserInteractionEnabled = true
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(self.imageEvidenceOnClick6))
        imageEvidence6.addGestureRecognizer(tap6)
        imageEvidence6.isUserInteractionEnabled = true
    }
    
    @objc func imageEvidenceOnClick1(){
        print("CLICK1")
    
        if imageEvidence1.image != nil{
            idImageView = 0
            imageSelectionable = Client.evidences.array_evidences[0]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
            
        }else{
            print("dont have image")
        }
    }
    
    @objc func imageEvidenceOnClick2(){
        print("CLICK22")
        
        if imageEvidence2.image != nil{
            idImageView = 1
            imageSelectionable = Client.evidences.array_evidences[1]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
            
            
        }else{
            print("dont have image")
        }
    }
    
    @objc func imageEvidenceOnClick3(){
        print("CLICK333")
        
        if imageEvidence3.image != nil{
            idImageView = 2
            imageSelectionable = Client.evidences.array_evidences[2]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
        }else{
            print("dont have image")
        }
        
    }
    
    @objc func imageEvidenceOnClick4(){
        print("CLICK4444")
        if imageEvidence4.image != nil{
            idImageView = 3
            imageSelectionable = Client.evidences.array_evidences[3]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
        }else{
            print("dont have image")
        }
    }
    @objc func imageEvidenceOnClick5(){
        print("CLICK55555")
        if imageEvidence5.image != nil{
            idImageView = 4
            imageSelectionable = Client.evidences.array_evidences[4]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
        }else{
            print("dont have image")
        }
    }
    @objc func imageEvidenceOnClick6(){
        print("CLICK666666")
        if imageEvidence6.image != nil{
            idImageView = 5
            imageSelectionable = Client.evidences.array_evidences[5]
            performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
        }else{
            print("dont have image")
        }
        
    }
    func loadImages(){
        let arrayEvidences = Client.evidences.array_evidences
        print(arrayEvidences)
        imageEvidence1.image = arrayEvidences[0]
        if arrayEvidences.indices.contains(1){
            imageEvidence2.image = arrayEvidences[1]
        }
        if arrayEvidences.indices.contains(2){
            imageEvidence3.image = arrayEvidences[2]
        }
        if arrayEvidences.indices.contains(3){
            imageEvidence4.image = arrayEvidences[3]
        }
        if arrayEvidences.indices.contains(4){
            imageEvidence5.image = arrayEvidences[4]
        }
        if arrayEvidences.indices.contains(5){
            imageEvidence6.image = arrayEvidences[5]
        }
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
    
    func openPhoto(selection: String){
        //seleccionable=selection
        performSegue(withIdentifier: "ListToPreviewSegue", sender: self)
    }
    
    @IBAction func btnCameraOnClick(_ sender: Any) {
        showImagePicker(selectedSource: .camera)
    }
    
    @IBAction func btnGaleriaOnClick(_ sender: Any) {
        showImagePicker(selectedSource: .photoLibrary)
    }
    
    @IBAction func btnAcceptOnClick(_ sender: Any) {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerPhoto{
            destino.imageSelectioned = imageSelectionable
            destino.idImageView = idImageView
        }
    }

}
