import UIKit

class Invited:Codable{
    var id:String
    var nombre:String
    
    init(id:String, nombre:String) {
        self.id = id
        self.nombre = nombre
        //if id != nil {self.id = id ?? ""}
        //if nombre != nil {self.nombre = nombre ?? ""}
    }
}
