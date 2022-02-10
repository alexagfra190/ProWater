//
//  ViewControllerAcc2.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit
import DropDown

class ViewControllerAcc2: UIViewController {
    
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Botones
    @IBOutlet weak var btn_next: UIButton!
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    //page control
    @IBOutlet weak var page_controller: UIPageControl!
    //Entradas de texto
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_username: UITextField!
    @IBOutlet weak var et_password: UITextField!
    @IBOutlet weak var et_paswword2: UITextField!
    @IBOutlet weak var et_invited: UITextField!
    //DropDown
    let list:DropDown = {
       let list = DropDown()
        list.dataSource = []
        return list
    }()
    
    var vendedores : [Invited]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        page_controller.configure(page: 1)
        configureSVG() //Se agregan los .svg a los elementos
        configureDropDown()
        getVendedores()
        hideKeyboard()
        loadData()
    }
    
    func setData(){
        Seller.email = et_email.text!
        Seller.username = et_username.text!
        Seller.password = et_password.text!
        
        User.email = et_email.text ?? ""
        User.username = et_username.text ?? ""
        User.password = et_password.text ?? ""
    }
    
    func loadData(){
        et_email.text = Seller.email
        et_username.text = Seller.username
        et_password.text = Seller.password
    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
    }
    
    func configureDropDown(){
       // et_invited.isEnabled = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        et_invited.addGestureRecognizer(gesture)
        list.anchorView = et_invited
        
        list.selectionAction = {index, title in
            //print("index \(index), nombre\(title), id \(self.vendedores![index].id)")
            self.et_invited.text = self.vendedores![index].nombre
            Seller.id_invito = Int(self.vendedores![index].id) ?? 0
        }
    }
    
    func getVendedores(){
        let urlString = "\(Strings.ws_server)\(Strings.ws_getVendedores)"
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        components?.queryItems = [
            //URLQueryItem(name: "user", value: userData),
            //URLQueryItem(name: "pass", value: passData)
        ]
        
        NetworkingProvider.shared.consulta(urlString: urlString, parameters: components!) { (data) in
            
            DispatchQueue.main.async {
                do{
                    let Decoder = JSONDecoder()
                    self.vendedores = try Decoder.decode([Invited].self, from: data)
                    
                    self.vendedores!.forEach {vendedor in
                        self.list.dataSource.append(vendedor.nombre)
                    }
                    
                }catch let error{
                    print(error)
                }
            }
        } failure: { (error) in
            print(error)
        }
    }
    
    //Eventos click
    @IBAction func next_page(_ sender: Any) {
        setData()
        performSegue(withIdentifier: "vcAccount3", sender: self)    }
    @IBAction func nav_backPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    @objc func didTapItem() {
        list.show()
    }
}
