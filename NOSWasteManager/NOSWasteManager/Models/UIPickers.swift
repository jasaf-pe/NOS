//
//  UIPickers.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation
import UIKit

class EntryPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var textField: UITextField?
    var data: [String]?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField?.text = data?[row]
        self.textField?.textColor = UIColor.black}
}
