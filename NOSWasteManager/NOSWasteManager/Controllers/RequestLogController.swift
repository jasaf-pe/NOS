//
//  LogController.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import UIKit
import DeckTransition
import MapKit

class RequestLogController: UITableViewController {
    

    @IBOutlet var siteLabel: UILabel!
    public var siteController: SiteController? = nil
    var siteNames = ["Edf Colinas","Edf Colibri"]
    var siteAdresses = ["Rua Aurora","Rua da Misericordia"]
    
    var sites:[SiteInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sites = createEntry()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationItem.hidesBackButton = true
        if let destination = segue.destination as? CollectionEntryController {
            destination.siteController = self
        }
    }
    
    @objc private func enterCollectionEntries() {
        self.performSegue(withIdentifier: "NavigateToCollectionEntry", sender: nil)
    }
    
    func createEntry()-> [SiteInformation] {
        let entryOne = SiteInformation(name: "Edf Colinas", address: "Rua Aurora", location: CLLocation(latitude: 0.0001, longitude: 0.0001))
        let entryTwo = SiteInformation(name: "Edf Colibri", address: "Rua da Misericordia", location: CLLocation(latitude: 0.0005, longitude: 0.0005))
        return [entryOne,entryTwo]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.siteNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "requestCell", for: indexPath)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd-MM-yyyy"
        
        
        cell.textLabel?.text = Date().description
        return cell
    }
    
}

