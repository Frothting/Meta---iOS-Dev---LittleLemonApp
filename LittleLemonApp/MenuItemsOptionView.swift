//
//  MenuItemsOptionView.swift
//  LittleLemonApp
//
//  Created by Christian  Cordy on 2/3/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var ViewModel: MenuViewViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("Done"){
                    dismiss()
                }
                .padding()
            }
            Form {
                Section("Categories"){
                    Button("Food"){
                        ViewModel.showFood.toggle()
                    }
                    .fontWeight(ViewModel.showFood ? .bold : .light)
                    
                    
                    Button("Drink"){
                        ViewModel.showDrink.toggle()
                    }
                    .fontWeight(ViewModel.showDrink ? .bold : .light)
                    
                    
                    Button("Dessert"){
                        ViewModel.showDesserts.toggle()
                    }
                    .fontWeight(ViewModel.showDesserts ? .bold : .light)
                }
                .foregroundColor(.black)
                
                Section("Sort By"){
                    Button("Most Popular"){
                        ViewModel.sortBy = .popularity
                    }
                    .fontWeight(ViewModel.sortBy == .popularity ? .bold : .light)
                    
                    Button("Price $ - $$$"){
                        ViewModel.sortBy = .price
                    }
                    .fontWeight(ViewModel.sortBy == .price ? .bold : .light)
                    
                    Button("A-Z"){
                        ViewModel.sortBy = .atoz
                    }
                    .fontWeight(ViewModel.sortBy == .atoz ? .bold : .light)
                }
            }
            .navigationTitle(Text("Filter"))
        }
    }
}
