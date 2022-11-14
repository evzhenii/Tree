//
//  ButtonView.swift
//  Tree
//
//  Created by boockich mac on 14.11.2022.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonName: String
    var action: () -> Void
    
    var body: some View {
        Button(buttonName) {
            action()
        }
        .padding(15)
        .background(Color.accentColor)
        .foregroundColor(Color.white)
        .cornerRadius(12)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonName: "test", action: { } )
    }
}
