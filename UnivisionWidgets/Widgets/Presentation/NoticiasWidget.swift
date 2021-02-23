//
//  NoticiasWidget.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI

struct NoticiasWidget: View {
    let lastEntries = [
        Model(date: "13 Enero", title: "Titulo de prueba 1", description: "Descripcion de prueba del nuevo contenido para mostrarlo en el widget 1", image: "testImageUrl"),
        Model(date: "12 Enero", title: "Titulo de prueba 2", description: "Descripcion de prueba del nuevo contenido para mostrarlo en el widget 2", image: "testImageUrl"),
        Model(date: "11 Enero", title: "Titulo de prueba 3", description: "Descripcion de prueba del nuevo contenido para mostrarlo en el widget 3", image: "testImageUrl"),
        Model(date: "10 Enero", title: "Titulo de prueba 4", description: "Descripcion de prueba del nuevo contenido para mostrarlo en el widget 4", image: "testImageUrl")
    ]
    
    
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
            ForEach(lastEntries) { entry in
                NoticiasRow(noticia: entry)
                Divider()
            }
        }
    }
}

struct NoticiasWidget_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasWidget()
    }
}

