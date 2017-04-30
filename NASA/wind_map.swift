//
//  wind_map.swift
//  NASA
//
//  Created by Wallace Junior on 30/04/17.
//  Copyright © 2017 Wallace Junior. All rights reserved.
//

import Foundation
import UIKit


class wind_map: UIViewController{
    
    
    @IBOutlet weak var windMap: UIWebView!
    
    override func viewDidLoad() {
        let siteURL = URL(string: "https://earth.nullschool.net/pt/#current/wind/isobaric/500hPa/orthographic=-48.37,-1.98,302/loc=-20.173,-17.879")
        let siteURLRequest = URLRequest(url: siteURL!)
        windMap.loadRequest(siteURLRequest)
    }
    
}
