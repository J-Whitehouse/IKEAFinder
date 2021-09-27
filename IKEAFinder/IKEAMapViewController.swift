//
//  IKEAMapViewController.swift
//  IKEAFinder
//
//  Created by Whitehouse, Jarret M on 9/27/21.
//

import UIKit
import MapKit

class IKEAMapViewController: UIViewController {
    
    @IBOutlet private var mapView: MKMapView!
    
    var IKEABucket: IKEADataStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for IKEA in IKEABucket.allIKEAs {
            mapView.addAnnotation(IKEA)
        }
    }
}
