//
//  ViewControllerApp4.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit
import RadioGroup

class ViewControllerApp4: UIViewController {
    
    var rgCompania : RadioGroup? = nil
    var rgBankruptcy : RadioGroup? = nil
    
    //EditText
    @IBOutlet weak var et_campana: UITextField!
    @IBOutlet weak var et_fechaBancarrota: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fechaActual: UITextField!
    
    //Content RadioGroup
    @IBOutlet weak var v_contentConmpaniarb: UIView!
    @IBOutlet weak var v_contentBankruptcyrb: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initRadioGroup()
    }
    
    func setData(){
        Client.compania_hipotecaria = et_campana.text ?? ""
        Client.fecha_bancarrota = et_fechaBancarrota.text ?? ""
        Client.email = email.text ?? ""
        Client.fecha_actual = fechaActual.text ?? ""
        Client.tipo_compania = rgCompania?.selectedIndex
        Client.bancarrota = rgBankruptcy?.selectedIndex
    }
    
    func initRadioGroup(){
        rgCompania = RadioGroup(titles: ["Own","Rent"])
        rgCompania?.isVertical = false
        
        v_contentConmpaniarb.addSubview(rgCompania!)
        rgCompania?.translatesAutoresizingMaskIntoConstraints = false
        rgCompania?.leftAnchor.constraint(equalTo: v_contentConmpaniarb.leftAnchor).isActive = true
        rgCompania?.topAnchor.constraint(equalTo: v_contentConmpaniarb.topAnchor).isActive = true
        
        rgBankruptcy = RadioGroup(titles: ["Yes", "No"])
        rgBankruptcy?.isVertical = false
        
        v_contentBankruptcyrb.addSubview(rgBankruptcy!)
        rgBankruptcy?.translatesAutoresizingMaskIntoConstraints = false
        rgBankruptcy?.leftAnchor.constraint(equalTo: v_contentBankruptcyrb.leftAnchor).isActive = true
        rgBankruptcy?.topAnchor.constraint(equalTo: v_contentBankruptcyrb.topAnchor).isActive = true
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
        performSegue(withIdentifier: "vcEvidences", sender: self)
    }
}
