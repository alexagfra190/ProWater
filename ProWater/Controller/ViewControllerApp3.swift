//
//  ViewControllerApp3.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerApp3: UIViewController {
    
    //EditText
    @IBOutlet weak var et_ocupacion: UITextField!
    @IBOutlet weak var et_telefonoTrabajo: UITextField!
    @IBOutlet weak var et_salarioMensual: UITextField!
    @IBOutlet weak var et_tiempoTrabajo: UITextField!
    @IBOutlet weak var et_fechaCita: UITextField!
    @IBOutlet weak var et_otrosIngresos: UITextField!
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_fecha: UITextField!
    @IBOutlet weak var et_repartidor: UITextField!
    
    //contenedor del formulario de coaplicante
    @IBOutlet weak var viewFormCoaplicante: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setData(){
        Client.ocupacion = et_ocupacion.text ?? ""
        Client.telefono_trabajo = et_telefonoTrabajo.text ?? ""
        Client.salario_mensual = et_salarioMensual.text ?? ""
        Client.tiempo_tranajo = et_tiempoTrabajo.text ?? ""
        Client.fecha_cita = et_fechaCita.text ?? ""
        Client.otros_ingresos = et_otrosIngresos.text ?? ""
        Client.email = et_email.text ?? ""
        Client.fecha_actual = et_fecha.text ?? ""
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
    
    @IBAction func nextPAge(_ sender: Any) {
        var vc : String = ""
        if Client.tipo == 1 {
            setData()
            vc = "vcApp4"
        }else{
            vc = "vcEvidences"
        }
        performSegue(withIdentifier: vc, sender: self)
    }
    
    func dataCoaplicante(){
        if Client.tipo == 1 {
            viewFormCoaplicante.isHidden = false
        }else{
            viewFormCoaplicante.isHidden = true
        }
    }
}
