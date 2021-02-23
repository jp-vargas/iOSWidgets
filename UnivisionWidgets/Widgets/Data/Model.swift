//
//  Model.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import Foundation

struct Model: Identifiable, Codable {
    let date: String
    let title: String
    let description: String
    let image: String
    
    var id: String { title }
}
