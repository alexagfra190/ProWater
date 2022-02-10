//
//  ViewControllerApp1.swift
//  ProWater
//
//  Created by user188472 on 1/30/22.
//

import UIKit

class ViewControllerApp1: UIViewController {
    
    //EditText
    @IBOutlet weak var et_primerNombre: UITextField!
    @IBOutlet weak var et_inicial: UITextField!
    @IBOutlet weak var et_apellidos: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var et_fechaNacimiento: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var et_expediente: UITextField!
    @IBOutlet weak var et_TelefonoCasa: UITextField!
    @IBOutlet weak var et_telefonoCelular: UITextField!
    
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
    @IBAction func NextPage(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcApp2", sender: self)
    }
    
    func getData(){
        et_primerNombre.text = Client.nombre
        et_inicial.text = Client.inicial
        et_apellidos.text = Client.apellidos
        ssn.text = Client.ssn
        et_fechaNacimiento.text = Client.fecha_nacimiento
        id.text = Client.ID_solicitud
        et_expediente.text = Client.numero_expediente
        et_TelefonoCasa.text = Client.telefono_casa
        et_telefonoCelular.text = Client.telefono_celular
    }
    
    func setData(){
        Client.nombre = et_primerNombre.text ?? ""
        Client.inicial = et_inicial.text ?? ""
        Client.apellidos = et_apellidos.text ?? ""
        Client.ssn = ssn.text ?? ""
        Client.fecha_nacimiento = et_fechaNacimiento.text ?? ""
        Client.ID_solicitud = id.text ?? ""
        Client.numero_expediente = et_expediente.text ?? ""
        Client.telefono_casa = et_TelefonoCasa.text ?? ""
        Client.telefono_celular = et_telefonoCelular.text ?? ""
    }
}
