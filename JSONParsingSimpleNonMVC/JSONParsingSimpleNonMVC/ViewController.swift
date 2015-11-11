//
//  ViewController.swift
//  JSONParsingSimpleNonMVC
//
//  Created by KBryan on 2015-11-11.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit
import Alamofire
import MapKit

class ViewController: UIViewController {
    var mapPins = [MapPin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: API_URL)
        var lati:Double = 0.0
        var long:Double = 0.0
        var stationName:String = ""
        /// Alamofire API
        Alamofire.request(.GET, url!).responseJSON { (response) -> Void in
            // return the value of .Get Request
            let result = response.result
            // get some data from the API
            if let dict = result.value as? Dictionary<String,AnyObject> {
                print(dict)
                if let routes = dict["locations"] as? NSArray
            
                {
                    for route in routes {
                        if let name = route["name"] as? String  {
                            stationName = name
                          //  print(name)
                        }
                        if let lat = route["lat"] as? Double {
                            lati = lat
                        }
                        if let lng = route["lng"] as? Double {
                            long = lng
                        }
                        //print("End of Data Set")
                        let pin = MapPin(coordinate:CLLocationCoordinate2D(latitude: lati, longitude: long) , title: stationName, subtitle: "Set Name")
                        self.mapPins.append(pin)
                        print(self.mapPins)
                    }

                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

