//
//  SiteViewController.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 13/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import DeckTransition

class SiteController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public var collectionEntryController:CollectionEntryController? = nil
    
    // MARK: - Outlets
    @IBOutlet var sitesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sitesTableView.delegate = self
        sitesTableView.dataSource = self
        
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
    
}

// MARK: - TableView Protocol Methods

extension SiteController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Obra Rua Tiradentes"
        return cell
    }
    
}
