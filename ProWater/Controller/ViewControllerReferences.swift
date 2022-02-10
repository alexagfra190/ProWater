//
//  ViewControllerReferences.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerReferences: UIViewController {
    
    //EditText
    @IBOutlet weak var et_namer1: UITextField!
    @IBOutlet weak var relacionr1: UITextField!
    @IBOutlet weak var telefonor1: UITextField!
    @IBOutlet weak var emailr1: UITextField!
    @IBOutlet weak var et_nombrer2: UITextField!
    @IBOutlet weak var et_relacionr2: UITextField!
    @IBOutlet weak var et_telefonor2: UITextField!
    @IBOutlet weak var et_emailr2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setData() {
        Client.referencia1.nombre = et_namer1.text ?? ""
        Client.referencia1.relacion = relacionr1.text ?? ""
        Client.referencia1.telefono = telefonor1.text ?? ""
        Client.referencia1.email = emailr1.text ?? ""
        Client.referencia2.nombre = et_nombrer2.text ?? ""
        Client.referencia2.relacion = et_relacionr2.text ?? ""
        Client.referencia2.telefono = et_telefonor2.text ?? ""
        Client.referencia2.email = et_emailr2.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHeader"  {
            let vcHeader = segue.destination as! HeaderContainer
            vcHeader.titleheader = "Personal references"
            
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcCongratulations", sender: self)
    }
    
}
