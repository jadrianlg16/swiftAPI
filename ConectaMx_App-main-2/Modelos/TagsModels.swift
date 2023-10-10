//// TagModel.swift
//import SwiftUI
//import SwiftyJSON
//import Alamofire
//
//@Observable
//class TagModel {
//    var tags = [String] = []
//    
//    init() {
//        //fetchTags()
//    }
//    
//    func fetchTags() {
//        tags.removeAll()
//        
//        let url = "http:10.14.255.172:5000/get_tags"
//        
//        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { [self] data in
//            if let error = data.error{
//                print("Error de conexion")
//            }else{
//                
//                let json = try! JSON(data: data.data!)
//            }
//            if jason.count >0{
//                let tag = json[0]
//                let newTags = Tags(
//                    id: tag["_id"].stringValue,
//                    tags: (tag["name"].arrayObject as? [String])!
//                   // description: tag.1["description"].stringValue
//                )
//                tags.append(newTag)
//            }
//        }
//    }
//}
