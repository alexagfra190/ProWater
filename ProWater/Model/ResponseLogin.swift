import UIKit

class ResponseLogin : Codable {
    var res : String
    var user : UserR?
    var firma : String?
    
    init(res:String, user:UserR?, firma:String?){
        self.res = res
        self.user = user ?? nil
        self.firma = firma ?? ""
    }
}

class UserR : Codable {
    var id_vendedor : String
    var id_usuario : String
    var nombre : String
    var apellidos : String
    var email : String
    var token : String?
    var nombre_firma : String
    
    init(id_vendedor:String, id_usuario:String, nombre:String, apellidos:String, email:String, token:String?, nombre_firma:String) {
        self.id_vendedor = id_vendedor
        self.id_usuario = id_usuario
        self.nombre = nombre
        self.apellidos = apellidos
        self.email = email
        self.token = token ?? ""
        self.nombre_firma = nombre_firma
    }
}
