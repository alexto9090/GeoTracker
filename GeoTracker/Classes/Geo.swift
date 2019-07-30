

import Foundation
import UIKit



class Geo: NSObject {
    
    //MARK : OUTLET
    public static var shared: Geo = {
        let singleton = Geo()
        return singleton
    }()
    
    //MARK: OVERRIDE
    override init() {
        super.init()
    }
    
    //MARK: NESTED
    class Info: NSObject {
        
        var asType : String?
        var city: String?
        var country: String?
        var countryCode: String?
        var isp: String?
        var lat: Double?
        var lon: Double?
        var org: String?
        var query: String?
        var region: String?
        var regionName: String?
        var status: String?
        var timezone: String?
        var zip: String?
        
        init(_ json: [String: Any]) {
            super.init()

            asType = json["as"] as? String
            city = json["city"]as? String
            country = json["country"]as? String
            countryCode = json["countryCode"]as? String
            isp = json["isp"]as? String
            lat = json["lat"]as? Double
            lon = json["lon"]as? Double
            org = json["org"]as? String
            query = json["query"]as? String
            region = json["region"]as? String
            regionName = json["regionName"]as? String
            status = json["status"]as? String
            timezone = json["timezone"]as? String
            zip = json["zip"]as? String
        }
    }
}



extension Geo {

    func getGeoIp(handler:@escaping (Info?, Error?) -> Void) {
        
        var request = URLRequest(url: URL(string: "http://www.ip-api.com/json/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil else {
                handler(nil, error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                handler(Info(json), nil)
            } catch {
                handler(nil, error)
            }
        })
        task.resume()
    }

    func getGeoDetails(handler:@escaping (String?, Error?) -> Void) {

        var request = URLRequest(url: URL(string: "https://ipinfo.io/org/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil else {
                handler(nil, error)
                return
            }
            let json = String(decoding: data!, as: UTF8.self)
            handler(json, nil)
        })
        task.resume()
    }
}
