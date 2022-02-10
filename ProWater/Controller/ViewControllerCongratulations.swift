//
//  ViewControllerCongratulations.swift
//  ProWater
//
//  Created by user188472 on 2/3/22.
//

import UIKit

class ViewControllerCongratulations: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        registrar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHeader"  {
            let vcHeader = segue.destination as! HeaderContainer
            vcHeader.titleheader = "Mew Application"
            
        }
    }
    
    func registrar(){
        let urlString = "\(Strings.ws_server)\(Strings.ws_registrarCliente)"
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if Client.tipo == 1 {
            components?.queryItems = [
                URLQueryItem(name: "data_cliente", value: String(data: Client.getJsonAplicante(), encoding: .utf8)),
                URLQueryItem(name: "data_referencia1", value: String(data: Client.referencia1.getJson(), encoding: .utf8)),
                URLQueryItem(name: "data_referencia2", value: String(data: Client.referencia2.getJson(), encoding: .utf8))
            ]
            
            /*for i in 0...Client.evidences.array_evidences.count-1 {
                components?.queryItems?.append(URLQueryItem(name: "evidencia_\(i)", value: Client.evidences.array_evidences[i].toBase64(format: .jpeg(1))))
            }*/
            
        }else{
            components?.queryItems = [
                URLQueryItem(name: "data_cliente", value: String(data: Client.getJsonCoaplicante(), encoding: .utf8))
            ]
        }
        
        components?.queryItems?.append(URLQueryItem(name: "tipo", value: String(Client.tipo!)))
        components?.queryItems?.append(URLQueryItem(name: "id_vendedor", value: String(Seller.id!)))
        components?.queryItems?.append(URLQueryItem(name: "firma_cliente", value: Client.signature?.toBase64(format: .png)))
        
        print(components?.queryItems)
        
        NetworkingProvider.shared.consulta(urlString: urlString, parameters: components!) { (data) in
            
            DispatchQueue.main.async {
                do{
                    print(String(data: data, encoding: .utf8))
                    
                }catch let error{
                    print(error)
                }
            }
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "vcPDF", sender: self)
    }
}
