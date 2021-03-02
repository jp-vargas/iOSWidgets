//
//  Model.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 1/03/21.
//

import Foundation

struct Model: Identifiable, Codable {
    let title: String
    let description: String
    let url: String
    let date: String
    
    var id: String { title }
}
