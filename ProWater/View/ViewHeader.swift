//
//  ViewHeader.swift
//  ProWater
//
//  Created by user188472 on 1/19/22.
//

import UIKit
import SVGKit

class ViewHeader: UIView{
    
    let imgLogo:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "prowaterLogo")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        return imageView
    }()
    let imgHeader:UIImageView = {
        let imageView = UIImageView()
        let svgHeager : SVGKImage = SVGKImage(named: "forma_titulos-51")
        imageView.image = svgHeager.uiImage
        imageView.contentMode = UIView.ContentMode.scaleToFill
        return imageView
    }()
    
    let lblTitle:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 28, green: 155, blue: 211)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Title"
        return label
    }()
    
    init(title : String){
        super.init(frame: .zero)
        
        addSubview(imgHeader)
        imgHeader.translatesAutoresizingMaskIntoConstraints = false
        imgHeader.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imgHeader.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imgHeader.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        imgHeader.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        imgHeader.addSubview(imgLogo)
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.topAnchor.constraint(equalTo: imgHeader.topAnchor, constant: 10).isActive = true
        imgLogo.rightAnchor.constraint(equalTo: imgHeader.rightAnchor, constant: -40).isActive = true
        imgLogo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imgLogo.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        imgHeader.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.topAnchor.constraint(equalTo: imgHeader.topAnchor, constant: 40).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: imgHeader.leftAnchor, constant: 30).isActive = true
        lblTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
