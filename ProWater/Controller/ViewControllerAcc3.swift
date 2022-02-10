//
//  ViewControllerAcc3.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit

class ViewControllerAcc3: UIViewController {
    
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Buttons
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    //page_controller
    @IBOutlet weak var page_controller: UIPageControl!
    //Entradas de texto
    @IBOutlet weak var et_bankName: UITextField!
    @IBOutlet weak var et_routingNumber: UITextField!
    @IBOutlet weak var et_accountNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        page_controller.configure(page: 2)
        configureSVG()
        hideKeyboard()
        loadData()
    }
    
    func setData(){
        Seller.nombre_banco = et_bankName.text!
        Seller.numero_ruta = et_routingNumber.text!
        Seller.numero_cuenta = et_accountNumber.text!
    }
    
    func loadData(){
        et_bankName.text = Seller.nombre_banco
        et_routingNumber.text = Seller.numero_ruta
        et_accountNumber.text = Seller.numero_cuenta
    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
    }
    
    @IBAction func next_page(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcAccount4", sender: self)
    }
    
    @IBAction func nav_backPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
}
