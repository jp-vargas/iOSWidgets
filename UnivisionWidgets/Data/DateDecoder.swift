//
//  DateDecoder.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 1/03/21.
//

import Foundation

final class DateDecoder: JSONDecoder {
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}

