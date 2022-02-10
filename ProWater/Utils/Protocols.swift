//
//  Protocols.swift
//  ProWater
//
//  Created by user188472 on 1/19/22.
//

import UIKit
import SVGKit

let svgHeader = SVGKImage(named: "forma_titulos-51")
let svgBtnBack = SVGKImage(named: "flecha_paginanterior-44")
let svgBtnHome = SVGKImage(named: "boton_home-45")
let svgBtnNext = SVGKImage(named: "flecha_pagina_siguiente-46")
let svgAviso   = SVGKImage(named: "Icono_aviso-37")
let svgiconnoConfirmacion = SVGKImage(named: "flecha_firma_confirmada-52")

let svgBtnCamera   = SVGKImage(named: "icono_camara-41")
let svgBtnGalery   = SVGKImage(named: "Icono_galeria-42")

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension String {
    func getServer() -> String{
        return "https://pandora-ul.com/ProWater/"
    }
}

extension UIView {
    func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    private func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
}

extension UIPageControl {
    func configure(page: Int){
        self.isEnabled = false
        self.currentPage = page
        self.pageIndicatorTintColor = UIColor(named: "pw_blue")
    }
}

extension UIImageView {
    func viewHeader(){
        self.image = svgHeader?.uiImage
        self.contentMode = ContentMode.scaleToFill
    }
    
    func setSvgAviso(){
        self.image = svgAviso?.uiImage
        self.contentMode = ContentMode.scaleToFill
    }
    
    func setConfirmado(){
        self.image = svgiconnoConfirmacion?.uiImage
        self.contentMode = ContentMode.scaleToFill
    }
}

extension UIButton {
    
    func svgCamera(){
        svgBtnCamera?.size = CGSize(width: 200, height: 200)
        self.setImage(svgBtnCamera?.uiImage, for: .normal)
    }
    
    func svgGalery(){
        svgBtnGalery?.size = CGSize(width: 200, height: 200)
        self.setImage(svgBtnGalery?.uiImage, for: .normal)
    }
    func svgBack(){
        svgBtnBack?.size = CGSize(width: 40, height: 40)
        self.setImage(svgBtnBack?.uiImage, for: .normal)
    }
    
    
    func svgNext(){
        svgBtnNext?.size = CGSize(width: 40, height: 40)
        self.setImage(svgBtnNext?.uiImage, for: .normal)
    }
    
    func svgHome(){
        svgBtnHome?.size = CGSize(width: 50, height: 50)
        self.setImage(svgBtnHome?.uiImage, for: .normal)
    }
    
    func buttonStyle1(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(named: "pw_blue")?.cgColor
        self.layer.cornerRadius = 10
    }
    
}

extension UIViewController {
    
    func hideKeyboard(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        //NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func KeyboardWillShow(notification : NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification : NSNotification){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    

}

public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    func toBase64(format: ImageFormat) -> String? {
        var imageData : Data?
        switch format {
        case .png:
            imageData = self.pngData()
        case .jpeg(let compression):
            imageData = self.jpegData(compressionQuality: compression)
        }
        
        return imageData?.base64EncodedString()
    }
}
