//
//  ContentView.swift
//  LittleLemonApp
//
//  Created by Christian  Cordy on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ViewModel: MenuViewViewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                MenuItemsView(ViewModel: ViewModel)
                    .navigationBarTitle(Text("Menu"))
            }
            
        }
        .onAppear(){
            ViewModel.mockData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
