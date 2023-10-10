
// PostModel.swift
import SwiftUI
import SwiftyJSON
import Alamofire

@Observable
class PostModel {
    var posts = [Post]()
    
    init() {
        
    }
    
    func fetchPosts() {
        posts.removeAll()
        
       let url = "http://10.14.255.172:5000/get_posts"
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { [self] data in
            if let error = data.error{
                print("Error de conexion")
            }else{
                
                let json = try! JSON(data: data.data!)
            
            if json.count > 0 {
                let newPost = Post(
                    id: post.1["_id"].stringValue,
                    title: post.1["title"].stringValue,
                    content: post.1["content"].stringValue,
                    organizationId: post.1["organizationId"].stringValue,
                    createdAt: post.1["createdAt"].stringValue,
                    updatedAt: post.1["updatedAt"].stringValue
                )
                
                posts.append(newPost)
            }
            }
        }
    }
}
