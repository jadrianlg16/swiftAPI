// TagModel.swift
import SwiftUI
import SwiftyJSON
import Alamofire

@Observable
class TagsModel {
    var tags: [Tag] = []
    
    init() {
        
    }
    
    func fetchTags() {
        tags.removeAll()
        
        let url = "http://10.14.255.172:5000/get_tags"
        //print(url)
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { [self] data in
            if let error = data.error{
                print("Error de conexion")
            }else{
                
                let json = try! JSON(data: data.data!)
                
                if json.count > 0 {
                    let tag = json[0]
                    let newTags = Tag(
                        id: tag["_id"].stringValue,
                        tags: tag["name"].stringValue
                       
                    )
                    //print(newTags)
                    tags.append(newTags)
                }
            }
        }
    }
}
