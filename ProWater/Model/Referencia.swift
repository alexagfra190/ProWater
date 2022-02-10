import UIKit

class Referencia {
    var nombre      : String = ""
    var relacion    : String = ""
    var telefono    : String = ""
    var email       : String = ""
    
    func getJson() -> Data {
        var jsonData : Data = Data()
        let arrayData : [String : String] = [
            "nombre"    : nombre,
            "Relacion"  : relacion,
            "telefono"  : telefono,
            "email"     : email
        ]
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: arrayData, options: .prettyPrinted)
            //decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
        } catch {
            print(error.localizedDescription)
        }
        return jsonData
    }
}
