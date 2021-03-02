//
//  NoticiasWidgetSmall.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 1/03/21.
//

import SwiftUI
import Kingfisher

struct NoticiasWidgetSmall: View {
    let noticia: Model
    
    var body: some View {
        VStack {
            Spacer()
            Text(formatDate(date: noticia.date))
                .italic()
                .font(.system(size: 10))
                .colorInvert()
                .multilineTextAlignment(.trailing)
                
            Text(noticia.title)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .colorInvert()
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
        .padding(4)
        .background(
            KFImage(URL(string: noticia.url))
                .fade(duration: 1)
                .resizable()
        )
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

struct NoticiasWidgetSmall_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasWidgetSmall(noticia: Model(title: "Title prueba", description: "Description pruea", url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb", date: "")
        )
    }
}
