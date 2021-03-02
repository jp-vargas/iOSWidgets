//
//  ViewController.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    private func getLastEntries() {
        let URL = Connection.BASE_URL + Connection.Suffix
        AF
            .request(URL, method: .get)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Response.self, decoder: DateDecoder()) { response in
                let widget = response.value?.data?.widgets[0].contents
                var arrayOfentries: Array<Model> = []
                for i in 0...2 {
                    let item = widget![i]
                    let title = item.title
                    let description = item.description
                    let url = item.image.renditions.original.href
                    let date = item.updateDate
                    
                    let mModel = Model(title: title!, description: description!, url: url , date: date!)
                    
                    arrayOfentries.append(mModel)
                }
                
                guard let entryData = try? JSONEncoder().encode(arrayOfentries) else {
                    return
                }
        
                UserDefaults(suiteName: Connection.GROUP_NAME)!.set(entryData, forKey: "entries")
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getLastEntries()
    }
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}

