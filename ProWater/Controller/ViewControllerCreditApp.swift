//
//  ViewControllerCreditApp.swift
//  ProWater
//
//  Created by user188472 on 1/27/22.
//

import UIKit

class ViewControllerCreditApp: UIViewController {
    
    @IBOutlet weak var headerCredtApp: reusableHeader!
    let header : HeaderContainer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerCredtApp.reusableHeaderTitle.text = "Credit App"
    }
    


    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "vcMenuApp", sender: self)
    }
}


