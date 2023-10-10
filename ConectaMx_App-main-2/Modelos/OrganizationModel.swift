
// OrganizationModel.swift
import SwiftUI
import SwiftyJSON
import Alamofire

@Observable
class OrganizationModel {
    var organizations = [Organization]()
    
    init() {
        
    }
    
    func fetchOrganizations() {
        organizations.removeAll()
        
        let url = "http://10.14.255.172:5000/get_organizations"
        
        AF.request(url, method: .get, encoding: URLEncoding.default).responseData { [self] data in
            if let error = data.error{
                print("Error de conexion")
            }else{
                
                let json = try! JSON(data: data.data!)
                
                if json.count > 0  {
                let location = Location(
                    address: organization.1["location"]["address"].stringValue,
                    city: organization.1["location"]["city"].stringValue,
                    state: organization.1["location"]["state"].stringValue,
                    country: organization.1["location"]["country"].stringValue,
                    zip: organization.1["location"]["zip"].stringValue
                )
                
                let contact = Contact(
                    email: organization.1["contact"]["email"].stringValue,
                    phone: organization.1["contact"]["phone"].stringValue
                )
                
                let socialMedia = SocialMedia(
                    facebook: organization.1["socialMedia"]["facebook"].stringValue,
                    twitter: organization.1["socialMedia"]["twitter"].stringValue,
                    instagram: organization.1["socialMedia"]["instagram"].stringValue,
                    linkedIn: organization.1["socialMedia"]["linkedIn"].stringValue
                )
                
                let newOrganization = Organization(
                    id: organization.1["_id"].stringValue,
                    name: organization.1["name"].stringValue,
                    location: location,
                    contact: contact,
                    serviceHours: organization.1["serviceHours"].stringValue,
                    socialMedia: socialMedia,
                    missionStatement: organization.1["missionStatement"].stringValue,
                    tags: (organization.1["tags"].arrayObject as? [String])!,
                    followers: (organization.1["followers"].arrayObject as? [String])!
                )
                
                organizations.append(newOrganization)
            }
            }
        }
    }
}
