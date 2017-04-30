//
//  mapViewController.swift
//  NASA
//
//  Created by Wallace Junior on 29/04/17.
//  Copyright © 2017 Wallace Junior. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let mylocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(mylocation, span)
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let siteURL = URL(string: "https://en.wikipedia.org/wiki/Short-billed_dowitcher")
        let siteURLRequest = URLRequest(url: siteURL!)
        webView.loadRequest(siteURLRequest)
        
        let span2:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-8.060642, -34.870370)
        let region2:MKCoordinateRegion = MKCoordinateRegionMake(location2, span2)
        map.setRegion(region2, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location2
        map.addAnnotation(annotation)
        
        let span3:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location3: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-8.063446, -34.871422)
        let region3:MKCoordinateRegion = MKCoordinateRegionMake(location3, span3)
        map.setRegion(region3, animated: true)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location3
        map.addAnnotation(annotation2)
        
        
        
        isAuthorizedtoGetUserLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }
    }
    
    @IBOutlet weak var webView: UIWebView!
    
    //if we have no permission to access user location, then ask user for permission.
    func isAuthorizedtoGetUserLocation() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    //this method will be called each time when a user change his location access preference.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("User allowed us to access location")
        }
    }
    
    
    //this method is called by the framework on         locationManager.requestLocation();
}
