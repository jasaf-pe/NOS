//
//  CloudKit.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import CloudKit

class CloudRepo {
    var cloudData = [CKRecord]()
    
    let db = CKContainer.default().publicCloudDatabase
    let dbUser = CKContainer.default().privateCloudDatabase
    
    func isICloudContainerAvailable() -> Bool{
        
        if FileManager.default.ubiquityIdentityToken != nil{
            
            return true
        }
        return false
        
    }
    
    func recordSite(siteInformation: SiteInformation) {
        
        let newRecord = CKRecord(recordType: "site")
        
        newRecord.setObject(siteInformation.name as CKRecordValue, forKey: "site")
        newRecord.setObject(siteInformation.name as CKRecordValue, forKey: "name")
        newRecord.setObject(siteInformation.address as CKRecordValue, forKey: "address")
        
        db.save(newRecord) { (record, error) in
            if let error = error {
                print("ERRO")
            } else {
                print("SUCESSO")
            }
        }
    }
    
    func loadSiteData(completion: @escaping ([SiteInformation]) -> Void  ) -> [SiteInformation] {
        
        var sites: [SiteInformation] = []
        let publicData = CKContainer.default().publicCloudDatabase

        let query = CKQuery(recordType: "site", predicate: NSPredicate(format: "TRUEPREDICATE", argumentArray: nil))
        
        publicData.perform(query, inZoneWith: nil) { (results, error) in
            if error != nil{
                
            } else {
                var cont = 0
                for i in results! {
                    cont += 1
                    var temp = (title: i["Title"] as! String, description: i["Description"] as! String, link: i["Link"] as! String, RecordChangeTag: i["recordChangeTag"] as! String)
                    temp.Status = i["Status"] as! Int
        
                    sites.append(temp)
                }
                
                completion(sites)
            }
            
        }
        //        group.wait()
        return news
        
}
