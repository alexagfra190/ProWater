import UIKit

class User : Codable {
    static var nombre           : String = ""
    static var username         : String = ""
    static var password         : String = ""
    static var email            : String = ""
    static var token            : String = ""
    
    static func getJson() -> Data {
        var jsonData : Data = Data()
        let arrayData : [String : String] = [
            "nombre"    : nombre,
            "usuario"   : username,
            "password"  : password,
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
