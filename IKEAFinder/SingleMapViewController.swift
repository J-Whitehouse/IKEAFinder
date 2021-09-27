//
//  SingleMapViewController.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/27/21.
//

import UIKit
import MapKit

class SingleMapViewController: UIViewController {
    
    //MARK: Outlets and Actions
    @IBOutlet private var mapView: MKMapView!
    
    //MARK: Attributes
    var selectedIKEA: IKEA!
    
    //MARK: EVent Lifecycle Functions
    override func viewDidLoad() {
        //set initial location to IUPUI
        //let initialLocation = CLLocation(latitude: 39.7714062, longitude: -86.1669968)
        
        let initialLocation = CLLocation(latitude: selectedIKEA.latitude, longitude: selectedIKEA.longitude)
    
        mapView.centerToLocation(location: initialLocation)
        mapView.addAnnotation(selectedIKEA)
    }
    
    
    
}

private extension MKMapView {
    func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 200) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
