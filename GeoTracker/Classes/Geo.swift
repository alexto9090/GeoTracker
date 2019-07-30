

import Foundation
import UIKit



public class Geo: NSObject {
    
    public class Info: NSObject {
        
        public var asType : String?
        public var city: String?
        public var country: String?
        public var countryCode: String?
        public var isp: String?
        public var lat: Double?
        public var lon: Double?
        public var org: String?
        public var query: String?
        public var region: String?
        public var regionName: String?
        public var status: String?
        public var timezone: String?
        public var zip: String?
        
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

    public class func getGeoIp(_ handler:@escaping (Info?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "http://www.ip-api.com/json/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { handler(nil, error); return }
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                handler(Info(json), nil)
            } catch {
                handler(nil, error)
            }
            
        }.resume()
    }

    public class func getGeoDetails(_ handler:@escaping (String?, Error?) -> Void) {
        var request = URLRequest(url: URL(string: "https://ipinfo.io/org/")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { handler(nil, error); return }
            let json = String(decoding: data!, as: UTF8.self)
            handler(json, nil)
        }.resume()
    }
}
