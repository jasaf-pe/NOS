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

class CollectionEntryController: UIViewController,UITextViewDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate {
    
    public var siteController: RequestLogController? = nil
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius = 1000.0
    
    // MARK: - SOLICITAR



    
    // MARK: - Outlets
    @IBOutlet var siteLabel: UILabel!

    @IBOutlet var textViews: [UIView]!
    @IBOutlet public var wasteTypeTextField: UITextField!
    @IBOutlet public var destinationTextField: UITextField!
    @IBOutlet public var transporterTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var shadowBlur: UIVisualEffectView!
    @IBOutlet var confirmButton: UIButton!
    
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //This Method is a Mockup
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: self.view)
        
            self.quantityTextField.text = "3 Caçambas"
            self.quantityTextField.textColor = UIColor.black

            self.distanceTextField.text = "10 Km"
            self.distanceTextField.textColor = UIColor.black
            self.priceTextField.text = "R$ 400,00"
            self.priceTextField.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.locationManager.delegate = self

        self.configureLocationServices()
        
        // MARK: Customizing Text View and Status Bar
        
        self.setNeedsStatusBarAppearanceUpdate()
        self.modalPresentationCapturesStatusBarAppearance = true
        
        
        // MARK: Configuring Picker View

        let toolBar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEditing))
        toolBar.setItems([doneButton], animated: false)
        let wasteTypes = WasteType.allCases.map { $0.description }
        let wasteTypePicker = EntryPicker()
        wasteTypePicker.textField = wasteTypeTextField
        wasteTypePicker.data = wasteTypes
        wasteTypePicker.delegate = wasteTypePicker
        wasteTypeTextField.inputAccessoryView = toolBar
        self.wasteTypeTextField.inputView = wasteTypePicker
        self.wasteTypeTextField.delegate = wasteTypePicker
        self.wasteTypeTextField.inputView?.backgroundColor = UIColor.white
        self.wasteTypeTextField.inputView?.addShadow()
        
        let destinationPicker = EntryPicker()
        destinationPicker.textField = destinationTextField
        destinationPicker.data = ["Usina Camaragibe", "Usina Olinda"]
        destinationPicker.delegate = destinationPicker
        self.destinationTextField.inputView = destinationPicker
        self.destinationTextField.delegate = destinationPicker
        self.destinationTextField.inputView?.backgroundColor = UIColor.white
        self.destinationTextField.inputView?.addShadow()
        
        let transporterPicker = EntryPicker()
        transporterPicker.textField = transporterTextField
        transporterPicker.data = ["Gerson Fretes", "Metralha Transporte"]
        transporterPicker.delegate = transporterPicker
        self.transporterTextField.inputView = transporterPicker
        self.transporterTextField.inputView?.backgroundColor = UIColor.white
        self.transporterTextField.delegate = transporterPicker
        self.transporterTextField.inputView?.addShadow()
        
        quantityTextField.keyboardType = .numberPad
        
        // MARK: Dropping shadow in views
        
        for view in self.textViews {
            view.layer.cornerRadius = 5
            if view.frame.height == 50 {
                view.layer.applySketchShadow(color: UIColor(red: 0.34, green: 0.34, blue: 0.34, alpha: 0.2), alpha: 1.0, x: 0.0, y: 0.0, blur: 12.5, spread: -50)
            } else {
                view.layer.applySketchShadow(color: UIColor(red: 0.34, green: 0.34, blue: 0.34, alpha: 0.2), alpha: 1.0, x: 0.0, y: 0.0, blur: 12.5, spread: 0)
            }
        }
        
        self.confirmButton.layer.cornerRadius = self.confirmButton.frame.height/2
        self.confirmButton.layer.masksToBounds = true
    
        // MARK: Adding gesture recognizer in popup
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissPopup))
        self.shadowBlur.addGestureRecognizer(tapGesture)
    }
    
    @objc func endEditing() {
        self.view.endEditing(true)
    }

    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            self.locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        self.centerMapOnUserLocation()
//    }
//
//    func centerMapOnUserLocation() {
//        guard let coordinate = self.locationManager.location?.coordinate else {
//            return
//        }
//        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
//
//    }
    
    // MARK: - Keyboard methods
    
    @objc func keyboardWillAppear() {
        UIView.animate(withDuration: 0.5, animations: {
            self.shadowBlur.alpha = 0.50
        })
    }
    
    @objc func keyboardWillDisappear(_ sender: UITextField!) {
        UIView.animate(withDuration: 0.5, animations: {
            self.shadowBlur.alpha = 0
        })
    }
    
    @objc func dismissPopup() {
        self.view.endEditing(true)
    }

}

