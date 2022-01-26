//
//  ViewController.swift
//  ProWater
//
//  Created by user188472 on 1/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtuser: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Login")
        txtuser.placeholder = "Username"
        txtpassword.placeholder = "Password"
        let userImage = UIImage(named: "person")
        addleftImage(txtFiedld: txtuser, andImage: userImage!)
        
        let passImage = UIImage(named: "lock")
        addleftImage(txtFiedld: txtpassword, andImage: passImage!)
        
    }
    
    func addleftImage(txtFiedld:UITextField,andImage img:UIImage){
        let leftImageView = UIImageView(frame: CGRect(x:0.0,y:0.0,width:img.size.width,height: img.size.height))
        leftImageView.image = img
        txtFiedld.leftView  =   leftImageView
        txtFiedld.leftViewMode = .always
    }

    @IBAction func txtCreateAcoount(_ sender: Any) {
        performSegue(withIdentifier: "vcAccount1", sender: self)
    }
}

