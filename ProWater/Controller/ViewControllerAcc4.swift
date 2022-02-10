//
//  ViewControllerAcc4.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit

class ViewControllerAcc4: UIViewController {
    //Tipo
    var tipoP : Int = 1 //1:seller,2:client
    
    //Canvas
    let canvas = Canvas()
    //ViewDraw
    @IBOutlet weak var viewDrawSignature: UIView!
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Buttons
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    @IBOutlet weak var btn_tryAgain: UIButton!
    //ViewAviso
    @IBOutlet weak var viewAviso: UIImageView!
    //scrollView
    @IBOutlet weak var viewScroll: UIScrollView!
    
    //Labels
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tipoP == 1 {
            lbl_title.text = "Seller's signature / firma de vendedor"
            lbl_name.text = "\(Seller.nombre) \(Seller.apellido)"
        }else{
            lbl_title.text = "Client's signature / firma de cliente"
            lbl_name.text = "\(Client.nombre) \(Client.apellidos)"
        }
        
        viewScroll.isScrollEnabled = false
        configureSVG()
        
        viewDrawSignature.layer.borderWidth = 0.5
        viewDrawSignature.layer.borderColor = UIColor.black.cgColor
        viewDrawSignature.layer.cornerRadius = 10
        viewDrawSignature.addSubview(canvas)
        canvas.translatesAutoresizingMaskIntoConstraints = false
        canvas.topAnchor.constraint(equalTo: viewDrawSignature.topAnchor).isActive = true
        canvas.leftAnchor.constraint(equalTo: viewDrawSignature.leftAnchor).isActive = true
        canvas.rightAnchor.constraint(equalTo: viewDrawSignature.rightAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: viewDrawSignature.bottomAnchor).isActive = true
        canvas.backgroundColor = .clear
        canvas.frame = view.frame
    }
    
    
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
        viewAviso.setSvgAviso()
        btn_tryAgain.buttonStyle1()
    }
    @IBAction func navBackPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    @IBAction func nextPage(_ sender: Any) {
        if canvas.bandera{
            if tipoP == 1 {
                Seller.seller_signature = canvas.geSignature()
            }else{
                Client.signature = canvas.geSignature()
            }
            
            performSegue(withIdentifier: "vcAccount4", sender: self)
        }
    }
    @IBAction func clearSignature(_ sender: Any) {
        canvas.clear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcAcc5 = segue.destination as? ViewControllerAcc5{
            vcAcc5.tipoP = self.tipoP
        }
    }
}
