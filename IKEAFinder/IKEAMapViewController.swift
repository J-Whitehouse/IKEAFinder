//
//  IKEAMapViewController.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/27/21.
//

import UIKit
import MapKit
import CoreLocation

class IKEAMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet private var mapView: MKMapView!
    
    var IKEABucket: IKEADataStore!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        determineCurrentLocation()
        
        for IKEA in IKEABucket.allIKEAs {
            mapView.addAnnotation(IKEA)
            
        }
    }
    
    //MARK: Instance MEthods
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: Delegate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        mapView.setRegion(mRegion, animated: true)
    }
}
