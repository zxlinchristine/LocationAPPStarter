//
//  LocationViewController.swift
//  LocationAPPStarter
//
//  Created by 羅壽之 on 2021/11/28.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var latLabel: UILabel!
    @IBOutlet var longLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    @IBAction func getLocation() {
        // Request the location update once
        locationManager.requestLocation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Requests the user’s permission to use location services
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
        }
        // Set the desired accuracy (optinally)
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // Set the delegate
        locationManager.delegate = self
        // Request the location update repeatedly
        
    }
    
    // Implement the receiver methods of location updates
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
        latLabel.text = "\(location.coordinate.latitude)"
            longLabel.text = "\(location.coordinate.longitude)"
        }
    }
}
