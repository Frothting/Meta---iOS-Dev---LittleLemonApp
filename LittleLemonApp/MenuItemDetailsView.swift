//
//  MenuItemDetailsView.swift
//  LittleLemonApp
//
//  Created by Christian  Cordy on 2/3/23.
//

import SwiftUI

//This part of the project is optional

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding()
            Text("Price")
                .bold()
                .padding(.top)
            Text("$ \(menuItem.Price)")
            Text("Ordered:")
                .bold()
                .padding(.top)
            Text(" \(menuItem.ordersCount)")
            Text("Ingredients:")
                .bold()
                .padding(.top)
            ForEach(menuItem.Ingredients, id: \.self){ ing in
                Text(ing.rawValue)
            }
        }
        .navigationTitle(Text(menuItem.Title))
    }
}
