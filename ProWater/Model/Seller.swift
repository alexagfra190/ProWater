import UIKit

class Seller {
    static var id               : Int? = nil
    static var apellido         : String = ""
    static var nombre           : String = ""
    static var telefono_casa    : String = ""
    static var telefono_celular : String = ""
    static var direccion        : String = ""
    static var ciudad           : String = ""
    static var estado           : String = ""
    static var cp               : String = ""
    static var lugar_trabajo    : String = ""
    static var email            : String = ""
    static var username         : String = ""
    static var password         : String = ""
    static var nombre_banco     : String = ""
    static var numero_ruta      : String = ""
    static var numero_cuenta    : String = ""
    static var id_invito        : Int = 0
    static var seller_signature : UIImage? = nil
    
    static func clear(){
        id = nil
        apellido = ""
        nombre = ""
        telefono_casa = ""
        telefono_celular = ""
        direccion = ""
        ciudad = ""
        estado = ""
        cp = ""
        lugar_trabajo = ""
        email = ""
        username = ""
        password = ""
        nombre_banco = ""
        numero_ruta = ""
        numero_cuenta = ""
        id_invito = 0
        seller_signature = nil
    }
    
    static func getJson() -> Data {
        var jsonData : Data = Data()
        let arrayData : [String : String] = [
            "nombre" : nombre,
            "apellidos" : apellido,
            "telefono_casa" : telefono_casa,
            "telefono_celular" : telefono_celular,
            "direccion" : direccion,
            "estado" : estado,
            "cp" : cp,
            "lugar_trabajo" : lugar_trabajo,
            "banco" : nombre_banco,
            "numero_ruta" : numero_ruta,
            "num_cuenta" : numero_cuenta,
            "id_invito" : String(id_invito)
        ]
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: arrayData, options: .prettyPrinted)
            //decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
        } catch {
            print(error.localizedDescription)
        }
        return jsonData
    }
    
    //static func getImageString() -> String {
        //let imageData = seller_signature?.pngData()
        //let imageBase64String = imageData?.base64EncodedString()
        //return imageBase64String ?? ""
    //}
}
