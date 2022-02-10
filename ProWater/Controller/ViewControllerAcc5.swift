//
//  ViewControllerAcc5.swift
//  ProWater
//
//  Created by user188472 on 1/21/22.
//

import UIKit

class ViewControllerAcc5: UIViewController {
    
    var tipoP : Int = 1
    //
    var sellerSignature : UIImage? = nil
    var clientSignature : UIImage? = nil
    //Header
    @IBOutlet weak var viewHeader: UIImageView!
    //Views
    @IBOutlet weak var ivAviso: UIImageView!
    @IBOutlet weak var ivSellerConfirm: UIImageView!
    @IBOutlet weak var ivClientConfirm: UIImageView!
    @IBOutlet weak var viewClientSignature: UIView!
    //Firmas
    @IBOutlet weak var ivSellerSignature: UIImageView!
    @IBOutlet weak var ivClientSignature: UIImageView!
    //Buttons
    @IBOutlet weak var btn_navBack: UIButton!
    @IBOutlet weak var btn_navHome: UIButton!
    @IBOutlet weak var btn_navNext: UIButton!
    //labels
    @IBOutlet weak var lbl_nombreVendedor: UILabel!
    @IBOutlet weak var lbl_nombreCliente: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tipoP == 1 {
            ivSellerSignature.image = Seller.seller_signature
            viewClientSignature.isHidden = true
            
        }else{
            ivSellerSignature.image = Seller.seller_signature
            ivClientSignature.image = Client.signature
            lbl_nombreVendedor.text = "\(Seller.nombre) \(Seller.apellido)"
            lbl_nombreCliente.text = "\(Client.nombre) \(Client.apellidos)"
        }
        configureSVG()
    }
    
    func configureSVG(){
        viewHeader.viewHeader()
        btn_navBack.svgBack()
        btn_navNext.svgNext()
        btn_navHome.svgHome()
        btn_navHome.isHidden = true
        ivAviso.setSvgAviso()
        ivSellerConfirm.setConfirmado()
        ivClientConfirm.setConfirmado()
    }

    @IBAction func navBackPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if tipoP == 1 {
            createAccountSeller()
        }else{
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: ViewControllerNewApp.self) {
                    self.navigationController?.popToViewController(controller, animated: true)
                }
            }
        }
    }
    
    func createAccountSeller(){
        let urlString = "\(Strings.ws_server)\(Strings.ws_registrarVendedor)"
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        
    
        components?.queryItems = [
            URLQueryItem(name: "data_user", value: String(data: User.getJson(), encoding: .utf8)),
            URLQueryItem(name: "data_seller", value: String(data: Seller.getJson(), encoding: .utf8)),
            URLQueryItem(name: "firma", value: Seller.seller_signature?.toBase64(format: .png))
        ]
        
        print(components?.queryItems)
        
        NetworkingProvider.shared.consulta(urlString: urlString, parameters: components!) { (data) in
            
            DispatchQueue.main.async {
                do{
                    print(String(data: data, encoding: .utf8))
                    self.navigationController?.popToRootViewController(animated: true)
                }catch let error{
                    print(error)
                }
            }
        } failure: { (error) in
            print(error)
        }
    }
}
