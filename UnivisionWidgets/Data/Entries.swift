//
//  Entries.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 23/02/21.
//

import Foundation


struct Response: Decodable {
    let data: ContentOfResponse?
}

struct ContentOfResponse: Decodable {
    let widgets: Array<WidgetData>
}

struct WidgetData: Decodable {
    let contents: Array<Noticia>
}

struct Noticia: Decodable {
    let title: String?
    let description: String?
    let updateDate: String?
    let image: Image
}

struct Image: Decodable {
    let renditions: ContentRenditions
}

struct ContentRenditions: Decodable {
    let original: ContentImage
}

struct ContentImage: Decodable {
    let href: String
}
