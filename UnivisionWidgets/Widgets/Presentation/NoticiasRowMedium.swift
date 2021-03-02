//
//  NoticiasRow.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI
import Kingfisher

struct NoticiasRowMedium: View {
    let noticia: Model
    
    var body: some View {
        HStack {
            Text(noticia.title)
                .font(.system(size: 14, weight: .bold, design: .rounded))
            KFImage(URL(string: noticia.url))
                .fade(duration: 1)
                .resizable()
        }
        .padding(4)
        .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    func formatDate(date: String) -> String {
        var Msg_Date_ = ""
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
       let dateFormatterPrint = DateFormatter()
       dateFormatterPrint.dateFormat = "MMM dd yyyy"
       let datee = dateFormatterGet.date(from: Msg_Date_)
       Msg_Date_ =  dateFormatterPrint.string(from: datee ?? Date())

       return Msg_Date_
    }
}

struct NoticiasRowMedium_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasRowMedium(noticia: Model(title: "Title prueba", description: "Description pruea", url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb", date: "12-12-2021")
        ).previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 80))
    }
}
