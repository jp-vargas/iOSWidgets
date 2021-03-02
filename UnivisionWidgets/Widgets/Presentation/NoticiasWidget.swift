//
//  NoticiasWidget.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI


struct NoticiasWidget: View {
    
    let entries: Array<Model>
    
    var body: some View {
        VStack {
            HStack {
                Text("Últimas Noticias:")
                    .font(.system(size: 16, weight: .bold, design: .serif))
                Spacer()
            }.padding(
                EdgeInsets(top: 12, leading: 8, bottom: 0, trailing: 0)
            )
            Divider()
            ForEach(entries) { entry in
                NoticiasRowMedium(noticia: entry)
                Divider()
            }
        }
    }
}

struct NoticiasWidget_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasWidget(entries: [Model(title: "Title prueba", description: "Description pruea", url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb", date:"")]
        )
    }
}

