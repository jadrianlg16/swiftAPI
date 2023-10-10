// PersonModel.swift
import SwiftUI
import SwiftyJSON
import Alamofire

@Observable
class PersonModel {
    var persons = [Person]()
    
    init() {
        
    }
    
    func fetchPersons() {
        persons.removeAll()
        
        let url = "http://10.14.255.172:5000/get_clients"
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { [self] data in
            if let error = data.error{
                print("Error de conexion")
            }else{
                
                let json = try! JSON(data: data.data!)
            
            if json.count > 0 {
                let newPerson = Person(
                    id: person.1["_id"].stringValue,
                    name: person.1["name"].stringValue,
                    phone: person.1["phone"].stringValue,
                    email: person.1["email"].stringValue,
                    interestedTags: (person.1["interestedTags"].arrayObject as? [String])!,
                    followedOrgs: (person.1["followedOrgs"].arrayObject as? [String])!
                )
                
                persons.append(newPerson)
            }
            }
        }
    }
}
