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
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    var mapPins = [MapPin]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: API_URL)
        var lati:Double = 0.0
        var long:Double = 0.0
        var stationName:String = ""
        // lacation manager code
        self.locationManager.delegate = self
        self.mapView.delegate = self
        // start updating location
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestWhenInUseAuthorization()
        self.mapView.showsUserLocation = true

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
                          guard let name = route["name"] as? String,
                                let lat = route["lat"] as? Double,
                                let lng = route["lng"] as? Double else {
                                print("error")
                                return
                        }

                        stationName = name
                        lati = lat
                        long = lng
                        let pin = MapPin(coordinate:CLLocationCoordinate2D(latitude: lati, longitude: long) , title: stationName, subtitle: "Set Name")
                        self.mapPins.append(pin)
                       self.mapView.addAnnotation(pin)
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

