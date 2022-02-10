//
//  ViewControllerAcc1.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit

class ViewControllerAcc1: UIViewController {
    
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Buttons
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    //control page
    @IBOutlet weak var page_controller: UIPageControl!
    //Entradas de texto
    @IBOutlet weak var et_firstName: UITextField!
    @IBOutlet weak var et_lastName: UITextField!
    @IBOutlet weak var et_homePhone: UITextField!
    @IBOutlet weak var et_cellPhone: UITextField!
    @IBOutlet weak var et_address: UITextField!
    @IBOutlet weak var et_city: UITextField!
    @IBOutlet weak var et_state: UITextField!
    @IBOutlet weak var et_cp: UITextField!
    @IBOutlet weak var et_workPlace: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        page_controller.configure(page: 0)
        configureSVG() //Se agregan los .svg a los elementos
        hideKeyboard()
        loadData()
        
    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
    }
    
    func setData(){
        Seller.nombre = et_firstName.text!
        Seller.apellido = et_lastName.text!
        Seller.telefono_casa = et_homePhone.text!
        Seller.telefono_celular = et_cellPhone.text!
        Seller.direccion = et_address.text!
        Seller.ciudad = et_city.text!
        Seller.estado = et_state.text!
        Seller.cp = et_cp.text!
        Seller.lugar_trabajo = et_workPlace.text!
    }
    
    func loadData(){
        et_firstName.text = Seller.nombre
        et_lastName.text = Seller.apellido
        et_homePhone.text = Seller.telefono_casa
        et_cellPhone.text = Seller.telefono_celular
        et_address.text = Seller.direccion
        et_city.text = Seller.ciudad
        et_state.text = Seller.estado
        et_cp.text = Seller.cp
        et_workPlace.text = Seller.lugar_trabajo
    }
    
    //Eventos de botones
    @IBAction func nextPage(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcAccount2", sender: self)
    }
    @IBAction func navBackPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    
}
