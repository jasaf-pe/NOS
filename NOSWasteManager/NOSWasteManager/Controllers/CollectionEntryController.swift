//
//  CollectionEntryController.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 13/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CollectionEntryController: UIViewController,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, CLLocationManagerDelegate, MKMapViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public var siteController: SiteController? = nil
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius = 1000.0

    
    // MARK: - Outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var siteLabel: UILabel!
    @IBOutlet var modalBar: UIView!
    
    @IBOutlet var wasteTypeTextField: UITextField!
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var transporterTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.mapView.showsUserLocation = true
        self.configureLocationServices()
        
        // MARK: Customizing Text View and Status Bar
        
        self.setNeedsStatusBarAppearanceUpdate()
        self.modalPresentationCapturesStatusBarAppearance = true
        self.modalBar.layer.cornerRadius = 2.5
        
        
        let typePicker = UIPickerView()
        typePicker.delegate = self
        typePicker.dataSource = self
        self.wasteTypeTextField.inputView = typePicker
        self.wasteTypeTextField.inputView?.backgroundColor = UIColor.white
        self.wasteTypeTextField.inputView?.addShadow()
    }

    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.centerMapOnUserLocation()
    }
    
    func centerMapOnUserLocation() {
        guard let coordinate = self.locationManager.location?.coordinate else {
            return
        }
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }

}

extension CollectionEntryController {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
}
