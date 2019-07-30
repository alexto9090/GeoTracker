//
//  InfoVC.swift
//  IPINFO
//
//  Created by baps on 25/07/19.
//  Copyright © 2019 Hits. All rights reserved.
//

import UIKit
import GeoTracker


class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Geo.shared.getGeoIp { (info, error) in
            if error == nil {
                if let geo = info { self.setData(geo) }
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func setData(_ info: GeoTracker.GeoInfo) {
//        (view.viewWithTag(100) as? UILabel)?.text = info.asType
//        (view.viewWithTag(101) as? UILabel)?.text = info.city
//        (view.viewWithTag(102) as? UILabel)?.text = info.country
//        (view.viewWithTag(103) as? UILabel)?.text = info.countryCode
//        (view.viewWithTag(104) as? UILabel)?.text = info.isp
//        (view.viewWithTag(105) as? UILabel)?.text = info.lat
//        (view.viewWithTag(106) as? UILabel)?.text = info.lon
//        (view.viewWithTag(107) as? UILabel)?.text = info.org
//        (view.viewWithTag(108) as? UILabel)?.text = info.query
//        (view.viewWithTag(109) as? UILabel)?.text = info.region
//        (view.viewWithTag(110) as? UILabel)?.text = info.regionName
//        (view.viewWithTag(111) as? UILabel)?.text = info.status
//        (view.viewWithTag(112) as? UILabel)?.text = info.timezone
//        (view.viewWithTag(113) as? UILabel)?.text = info.zip
//    }
}
