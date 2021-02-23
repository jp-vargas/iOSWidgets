//
//  NoticiasRow.swift
//  UnivisionWidgets
//
//  Created by Juan Vargas on 15/02/21.
//

import SwiftUI

struct NoticiasPlaceholder: View {
    var body: some View {
        VStack() {
            HStack {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: 200, height: 20, alignment: .leading)
                Spacer()
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: 50, height: 20, alignment: .leading)
            }
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(width: 400, height: 20, alignment: .leading)
        }.padding()
    }
}

struct NoticiasPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        NoticiasPlaceholder().previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 85))
    }
}
