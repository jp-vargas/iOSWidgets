//
//  NoticiasRow.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI

struct NoticiasRow: View {
    let noticia: Model
    
    var body: some View {
        VStack {
            HStack {
                Text(noticia.title)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                Spacer()
                Text(formatDate(date: noticia.date))
                    .italic()
                    .font(.caption2)
            }
            Text(noticia.description)
                .font(.caption)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

        }.padding(4)
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

struct NoticiasRow_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasRow(noticia: Model(title: "Title prueba", description: "Description pruea", url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb", date: "12-12-2021")
        ).previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 80))
    }
}
