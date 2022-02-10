//
//  Client.swift
//  ProWater
//
//  Created by user188472 on 2/1/22.
//

import UIKit

class Client : Codable{
    
    static var id                   : Int? = nil
    static var tipo                 : Int? = nil
    static var nombre               : String = ""
    static var inicial              : String = ""
    static var apellidos            : String = ""
    static var ssn                  : String = ""
    static var fecha_nacimiento     : String = ""
    static var ID_solicitud         : String = ""
    static var numero_expediente    : String = ""
    static var telefono_casa        : String = ""
    static var telefono_celular     : String = ""
    static var direccion            : String = ""
    static var ciudad               : String = ""
    static var estado               : String = ""
    static var cp                   : String = ""
    static var direccion_anterior   : String = ""
    static var empleador_actual     : String = ""
    static var ciudad_empleo        : String = ""
    static var estado_empleo        : String = ""
    static var ocupacion            : String = ""
    static var telefono_trabajo     : String = ""
    static var salario_mensual      : String = ""
    static var tiempo_tranajo       : String = ""
    static var fecha_cita           : String = ""
    
    static var otros_ingresos       : String = ""
    static var repartidor           : String = ""
    
    static var compania_hipotecaria : String = ""
    static var tipo_compania        : Int? = nil
    static var bancarrota           : Int? = nil
    static var fecha_bancarrota     : String = ""
    static var email                : String = ""
    static var fecha_actual         : String = ""
    static var buro                 : Int? = nil
    static var contrato             : Bool? = nil
    
    static var signature            : UIImage? = nil
    
    static var evidences = Evidences()
    
    static var referencia1              : Referencia = Referencia()
    static var referencia2              : Referencia = Referencia()
    
    static func clear(){
        self.id                 = nil
        self.tipo               = nil
        self.nombre             = ""
        self.inicial            = ""
        self.apellidos          = ""
        self.ssn                = ""
        self.fecha_nacimiento   = ""
        self.ID_solicitud       = ""
        self.numero_expediente  = ""
        self.telefono_casa      = ""
        self.telefono_celular   = ""
        self.direccion          = ""
        self.ciudad             = ""
        self.estado             = ""
        self.cp                 = ""
        self.direccion_anterior = ""
        self.empleador_actual   = ""
        self.ciudad_empleo      = ""
        self.estado_empleo      = ""
        self.ocupacion          = ""
        self.telefono_trabajo       = ""
        self.salario_mensual        = ""
        self.tiempo_tranajo         = ""
        self.fecha_cita             = ""
        self.otros_ingresos         = ""
        self.fecha_actual           = ""
        self.email                  = ""
        self.repartidor             = ""
        self.compania_hipotecaria   = ""
        self.tipo_compania          = nil
        self.bancarrota             = nil
        self.fecha_bancarrota       = ""
        self.buro                   = nil
        self.contrato               = nil
        self.evidences = Evidences()
        self.referencia1 = Referencia()
        self.referencia2 = Referencia()

    }
    
    static func getJsonAplicante() -> Data {
        var jsonData : Data = Data()
        let arrayData : [String : String] = [
            "Nombre" : self.nombre,
            "Inicial" : self.inicial,
            "Apellidos" : self.apellidos,
            "ssn" : self.ssn,
            "fecha_nacimiento" : self.fecha_nacimiento,
            "ID_solicitud" : self.ID_solicitud,
            "numero_expediente" : self.numero_expediente,
            "telefono_casa" : self.telefono_casa,
            "telefono_celular" : self.telefono_celular,
            "direccion" : self.direccion,
            "ciudad" : self.ciudad,
            "estado" : self.estado,
            "cp" : self.cp,
            "direccion_anterior" : self.direccion_anterior,
            "empleador_actual" : self.empleador_actual,
            "ciudad_empleo" : self.ciudad_empleo,
            "estado_empleo" : self.estado_empleo,
            "ocupacion" : self.ocupacion,
            "telefono_trabajo" : self.telefono_trabajo,
            "salario_mensual" : String(self.salario_mensual),
            "tiempo_trabajo" : self.tiempo_tranajo,
            "fecha_cita" : self.fecha_cita,
            "compañía_hipotecaria" : self.compania_hipotecaria,
            "bancarrota" : "\(self.bancarrota)",
            "fecha_bancarrota" : self.fecha_bancarrota,
            "email" : self.email,
            "fecha_actual" : self.fecha_actual,
            "contrato_enviado" : "1"
        ]
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: arrayData, options: .prettyPrinted)
            //decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
        } catch {
            print(error.localizedDescription)
        }
        return jsonData
    }
    
    static func getJsonCoaplicante() -> Data {
        var jsonData : Data = Data()
        let arrayData : [String : String] = [
            "Nombre" : self.nombre,
            "Inicial" : self.inicial,
            "Apellidos" : self.apellidos,
            "ssn" : self.ssn,
            "fecha_nacimiento" : self.fecha_nacimiento,
            "ID_solicitud" : self.ID_solicitud,
            "numero_expediente" : self.numero_expediente,
            "telefono_casa" : self.telefono_casa,
            "telefono_celular" : self.telefono_celular,
            "direccion" : self.direccion,
            "ciudad" : self.ciudad,
            "estado" : self.estado,
            "cp" : self.cp,
            "direccion_anterior" : self.direccion_anterior,
            "empleador_actual" : self.empleador_actual,
            "ciudad_empleo" : self.ciudad_empleo,
            "estado_empleo" : self.estado_empleo,
            "ocupacion" : self.ocupacion,
            "telefono_trabajo" : self.telefono_trabajo,
            "salario_mensual" : String(self.salario_mensual),
            "tiempo_trabajo" : self.tiempo_tranajo,
            "fecha_cita" : self.fecha_cita,
            "otros_ingresos" : self.otros_ingresos,
            "email" : self.email,
            "fecha_actual" : self.fecha_actual,
            "repartidor" : self.repartidor,
            "contrato_enviado" : "1"
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
