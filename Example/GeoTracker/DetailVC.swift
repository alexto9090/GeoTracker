//
//  DetailVC.swift
//  IPINFO
//
//  Created by baps on 25/07/19.
//  Copyright © 2019 Hits. All rights reserved.
//

import UIKit
import GeoTracker

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Geo.getGeoDetails { (info, error) in
            if error == nil {
                if let i = info { DispatchQueue.main.async { self.setData(i) } }
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func setData(_ info: String) {
        (view.viewWithTag(100) as? UILabel)?.text = info
    }
}
