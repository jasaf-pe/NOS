//
//  Cases.swift
//  NOSWasteManager
//
//  Created by Jorge Salvador on 14/04/19.
//  Copyright © 2019 Jorge Salvador. All rights reserved.
//

import Foundation

enum WasteType: CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .ClasseA: return "Reparo Pavimentação"
        case .ClasseB: return "Reparo Edificações"
        case .ClasseC: return "Demolição de Concreto"
        }
    }
    
    case ClasseA, ClasseB, ClasseC
}

