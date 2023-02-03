//
//  MenuItemsView.swift
//  LittleLemonApp
//
//  Created by Christian  Cordy on 2/3/23.
//

import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var ViewModel: MenuViewViewModel
    @State var showingDetailView = false
    @State var showFilterView = false
    
    @State var selectedMenuItem: MenuItem?
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            List {
                if ViewModel.showFood{
                    Section("Food") {
                        LazyVGrid(columns: threeColumnGrid) {
                            ForEach( try! ViewModel.foodItems.sorted(by: ViewModel.sortMethod())){ foodItem in
                                VStack{
                                    Rectangle().aspectRatio(contentMode: .fit)
                                    Text("\(foodItem.Title)")
                                }
                                .onTapGesture {
                                    showingDetailView.toggle()
                                    selectedMenuItem = foodItem
                                }
                                .navigationDestination(isPresented: $showingDetailView){
                                    if let mi = selectedMenuItem{
                                        MenuItemDetailsView(menuItem: mi)
                                    }
                                }
                            }
                        }
                    }
                }
                
                if ViewModel.showDrink{
                    Section ("Drinks"){
                        LazyVGrid(columns: threeColumnGrid) {
                            ForEach(ViewModel.drinkItems) { foodItem in
                                VStack{
                                    Rectangle().aspectRatio(contentMode: .fit)
                                    Text("\(foodItem.Title)")
                                }
                                .onTapGesture {
                                    showingDetailView.toggle()
                                    selectedMenuItem = foodItem
                                }
                                .navigationDestination(isPresented: $showingDetailView){
                                    if let mi = selectedMenuItem{
                                        MenuItemDetailsView(menuItem: mi)
                                    }
                                }
                            }
                        }
                    }
                }
                
                if ViewModel.showDesserts{
                    Section ("Dessert"){
                        LazyVGrid(columns: threeColumnGrid) {
                            ForEach(ViewModel.dessertItems) { foodItem in
                                VStack{
                                    Rectangle().aspectRatio(contentMode: .fit)
                                    Text("\(foodItem.Title)")
                                }
                                .onTapGesture {
                                    showingDetailView.toggle()
                                    selectedMenuItem = foodItem
                                }
                                .navigationDestination(isPresented: $showingDetailView){
                                    if let mi = selectedMenuItem{
                                        MenuItemDetailsView(menuItem: mi)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilterView){
                MenuItemsOptionView(ViewModel: ViewModel)
            }
        }
        .toolbar(){
            Image(systemName: "line.3.horizontal.decrease.circle")
                .onTapGesture {
                    showFilterView.toggle()
                }
        }
        .headerProminence(.increased)
        .listStyle(.inset)
    }
}
