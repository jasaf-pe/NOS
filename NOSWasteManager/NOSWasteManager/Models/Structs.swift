//
//  Destinations.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import MapKit

class SiteInformation {
    var name: String
    var address: String
    var location: CLLocation
    
    init(name: String, address: String, location: CLLocation){
        self.name = name
        self.address = address
        self.location = location
    }
}

class Destination {
    var name: String
    var address: String
    var location: CLLocation
    
    init(name: String, address: String, location: CLLocation){
        self.name = name
        self.address = address
        self.location = location
    }
}

class Transporter {
    var name: String
    var pricePerKm: Float
    
    init(name: String, pricePerKm: Float){
        self.name = name
        self.pricePerKm = pricePerKm
    }
}

class TransportRequest {
    var site: SiteInformation
    var destination: Destination
    var transporter: Transporter
    var date: Date
    
    init(site: SiteInformation, destination: Destination, transporter: Transporter){
        self.site = site
        self.destination = destination
        self.transporter = transporter
        self.date = Date()
    }
    
}

