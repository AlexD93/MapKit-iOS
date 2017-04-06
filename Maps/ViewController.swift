//
//  ViewController.swift
//  Maps
//
//  Created by Student on 2017-04-06.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    @IBOutlet var segmentControl: UISegmentedControl!
    var manager = CLLocationManager()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    @IBAction func segmentChanged(_ sender: Any) {
        
        switch segmentControl.selectedSegmentIndex{
        case 0:
            map?.mapType = MKMapType.standard
            break
        
        case 1:
            map?.mapType = MKMapType.satellite
            break
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        let latitude: CLLocationDegrees = userLocation.coordinate.latitude
        
        let longtitude: CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map?.setRegion(region, animated: false)
        
        let pin = MKPointAnnotation()
        pin.coordinate.latitude = userLocation.coordinate.latitude
        pin.coordinate.longitude = userLocation.coordinate.longitude
        pin.title = "It's me =)"
        map?.addAnnotation(pin)
 
    }



}

