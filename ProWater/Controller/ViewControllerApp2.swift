//
//  ViewControllerApp2.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerApp2: UIViewController {
    
    //EditText
    @IBOutlet weak var et_direccion: UITextField!
    @IBOutlet weak var ciudad: UITextField!
    @IBOutlet weak var et_estado: UITextField!
    @IBOutlet weak var et_cp: UITextField!
    @IBOutlet weak var et_direccionAnterior: UITextField!
    @IBOutlet weak var et_empleadorActual: UITextField!
    @IBOutlet weak var et_ciudadEmpleo: UITextField!
    @IBOutlet weak var et_estadoAnterior: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHeader"  {
            let vcHeader = segue.destination as! HeaderContainer
            if Client.tipo == 1 {
                vcHeader.titleheader = "Applicant"
            }else{
                vcHeader.titleheader = "Co - applicant"
            }
            
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcApp3", sender: self)
    }
    
    func setData(){
        Client.direccion = et_direccion.text ?? ""
        Client.ciudad = ciudad.text ?? ""
        Client.estado = et_estado.text ?? ""
        Client.cp = et_cp.text ?? ""
        Client.direccion_anterior = et_direccionAnterior.text ?? ""
        Client.empleador_actual = et_empleadorActual.text ?? ""
        Client.ciudad_empleo = et_ciudadEmpleo.text ?? ""
        Client.estado_empleo = et_estadoAnterior.text ?? ""
    }
    
    func getData(){
        et_direccion.text = Client.direccion
        ciudad.text = Client.ciudad
        et_estado.text = Client.estado
        et_cp.text = Client.cp
        et_direccionAnterior.text = Client.direccion_anterior
        et_empleadorActual.text = Client.empleador_actual
        et_ciudadEmpleo.text = Client.ciudad_empleo
        et_estadoAnterior.text = Client.estado_empleo
    }
}
