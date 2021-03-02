//
//  NoticiasWidget.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI


struct NoticiasWidgetMedium: View {
    
    let entries: Array<Model>
    
    var body: some View {
        VStack {
            ForEach(entries) { entry in
                NoticiasRow(noticia: entry)
                Divider()
            }
        }
    }
}

struct NoticiasWidgetMedium_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasWidgetMedium(entries: [Model(title: "Title prueba", description: "Description pruea", url: "https://st1.uvnimg.com/36/cb/c8d5e7ab453390cc4d25dd1cb54f/50ef2c06585343bc899147c9b25625cb", date:"")]
        )
    }
}

