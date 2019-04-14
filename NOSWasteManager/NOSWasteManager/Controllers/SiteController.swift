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
import QuartzCore

class SiteController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    public var collectionEntryController:CollectionEntryController? = nil
    var sites:[SiteInformation] = []
    
    // MARK: - Outlets
    @IBOutlet var sitesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sitesTableView.delegate = self
        sitesTableView.dataSource = self
        sites = createEntry()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        self.navigationController?.navigationItem.hidesBackButton = false
        if let destination = segue.destination as? RequestLogController {
            destination.siteController = self
        }
    }
    
    @objc private func enterCollectionEntries() {
        self.performSegue(withIdentifier: "NavigateToRequests", sender: nil)
    }
    
}



extension SiteController {
    
    func createEntry()-> [SiteInformation] {
        let entryOne = SiteInformation(name: "Edf Colinas", address: "Rua Aurora", location: CLLocation(latitude: 0.0001, longitude: 0.0001))
        let entryTwo = SiteInformation(name: "Edf Colibri", address: "Rua da Misericordia", location: CLLocation(latitude: 0.0005, longitude: 0.0005))
        return [entryOne,entryTwo]
    }
    
    // MARK: - TableView Protocol Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siteCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = sites[indexPath.row].name
        cell.detailTextLabel?.text = sites[indexPath.row].address
        return cell
    }
    
}

class SegueFromLeft: UIStoryboardSegue {
    
    override func perform() {
        let src: UIViewController = self.source
        let dst: UIViewController = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        src.navigationController!.view.layer.add(transition, forKey: kCATransition)
        src.navigationController!.pushViewController(dst, animated: false)
    }
}
