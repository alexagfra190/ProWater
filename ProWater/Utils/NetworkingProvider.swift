import Foundation

class NetworkingProvider{
    static let shared = NetworkingProvider()
    private let statusOk = 200...299
    let configuration = URLSessionConfiguration.default
    
    func consulta(urlString:String, parameters:URLComponents, success: @escaping (_ data:Data) -> (), failure: @escaping (_ error:String) -> ()){
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)
        
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        let query = parameters.url?.query
        
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = Data(query!.utf8)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            
            guard error == nil else{
                failure("error")
                return
            }
            
            guard let data = data else {
                failure("Sin datos")
                return
            }
            success(data)
            
            /*do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                   success(json)
                }
            }catch let error{
                failure(error.localizedDescription)
            }*/
           
        
        })
        task.resume()    }
}
