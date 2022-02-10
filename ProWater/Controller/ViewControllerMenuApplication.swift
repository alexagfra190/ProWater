//
//  ViewControllerMenuApplication.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerMenuApplication: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func createApplicant(_ sender: Any) {
        Client.tipo = 1 //Aplicante
        nextPage()
    }
    @IBAction func createCoapplicant(_ sender: Any) {
        Client.tipo = 2 //Coaplicante
        nextPage()
    }
    
    func nextPage(){
        performSegue(withIdentifier: "vcApp1", sender: self)
    }
}
