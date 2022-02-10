//
//  ViewController.swift
//  ProWater
//
//  Created by user188472 on 1/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    var dataUser : ResponseLogin? = nil

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
    
    func login(){
        let urlString = "\(Strings.ws_server)\(Strings.ws_login)"
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        let user = txtuser.text ?? ""
        let pass = txtpassword.text ?? ""
    
        components?.queryItems = [
            URLQueryItem(name: "user", value: user),
            URLQueryItem(name: "pass", value: pass)
        ]
        
        print(components?.queryItems)
        
        NetworkingProvider.shared.consulta(urlString: urlString, parameters: components!) { (data) in
            
            DispatchQueue.main.async {
                do{
                    let Decoder = JSONDecoder()
                    self.dataUser = try Decoder.decode(ResponseLogin.self, from: data)
                    
                    if self.dataUser?.res == "Acceso Correcto" {
                        Seller.id = Int((self.dataUser?.user!.id_vendedor)!)
                        Seller.nombre = (self.dataUser?.user!.nombre)!
                        Seller.apellido = (self.dataUser?.user!.apellidos)!
                        User.token = self.dataUser?.user?.token ?? ""
                        User.email = self.dataUser?.user?.email ?? ""
                        
                        print(self.dataUser?.firma)
                        
                        let newImageData = Data(base64Encoded: (self.dataUser?.firma)!)
                        if let newImageData = newImageData {
                            Seller.seller_signature = UIImage(data: newImageData)
                        }
                        
                        self.performSegue(withIdentifier: "vcHome", sender: self)
                    }else{
                        let alert = UIAlertController(title: "Sesión", message: self.dataUser?.res, preferredStyle: .alert)
                        alert.addAction(.init(title: "Aceptar", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }catch let error{
                    print(error)
                }
            }
        } failure: { (error) in
            print(error)
        }
    }

    @IBAction func txtCreateAcoount(_ sender: Any) {
        performSegue(withIdentifier: "vcAccount1", sender: self)
    }
    @IBAction func btnLogin(_ sender: Any) {
        login()
    }
}

