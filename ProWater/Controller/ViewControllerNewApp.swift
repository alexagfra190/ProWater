//
//  ViewControllerNewApp.swift
//  ProWater
//
//  Created by user188472 on 2/1/22.
//

import UIKit

class ViewControllerNewApp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func photoEvidence(_ sender: Any) {
        print("photo")
        if Client.evidences.array_evidences.count > 0 {
            performSegue(withIdentifier: "NewAppToList", sender: self)
        }else{
            performSegue(withIdentifier: "NewAppToPhotoSegue", sender: self)
            
        }
    }
    @IBAction func signatureEvidence(_ sender: Any) {
        performSegue(withIdentifier: "vcSellerClient", sender: self)
    }
    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "vcReferences", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcAcc4 = segue.destination as? ViewControllerAcc4{
            vcAcc4.tipoP = 2
        }
    }
}
