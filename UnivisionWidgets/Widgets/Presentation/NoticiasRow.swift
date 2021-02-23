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
                Text(noticia.date)
                    .italic()
                    .font(.caption2)
            }
            Text(noticia.description)
                .font(.caption)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

        }.padding(4)
    }
}

struct NoticiasRow_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasRow(
            noticia: Model(date: "13 Enero", title: "Titulo de prueba 1", description: "Descripcion de prueba del nuevo contenido para mostrarlo en el widget 1", image: "testImageUrl")
        ).previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 80))
    }
}
