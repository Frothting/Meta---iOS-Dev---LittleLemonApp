//
//  MenuStructure.swift
//  LittleLemonApp
//
//  Created by Christian  Cordy on 2/3/23.
//

import Foundation

enum SortBy {
    case popularity
    case price
    case atoz
}

class MenuViewViewModel: ObservableObject {
    @Published var foodItems: [MenuItem] = []
    @Published var drinkItems: [MenuItem] = []
    @Published var dessertItems: [MenuItem] = []
    
    @Published var showFood = true
    @Published var showDrink = true
    @Published var showDesserts = true
    
    @Published var sortBy: SortBy = .popularity
    
    func addMenuItem(_ item: MenuItem){
        switch item.Category {
        case .Food:
            foodItems.append(item)
        case .Drink:
            drinkItems.append(item)
        case .Dessert:
            dessertItems.append(item)
        }
    }
    
    func sortMethod() -> ((MenuItem, MenuItem) throws -> Bool){
        switch self.sortBy {
        case .popularity:
            return {
                $0.ordersCount > $1.ordersCount
            }
        case .price:
            return {
                $0.Price > $1.Price
            }
        case .atoz:
            return {
                $0.Title > $1.Title
            }
        }
    }
}


class MenuItem: Identifiable {
    @Published var id = UUID()
    @Published var Price: Double
    @Published var ordersCount: Int = 0
    @Published var Title: String
    @Published var Category: MenuCategory
    @Published var Ingredients: [Ingredient]
    
    init(id: UUID = UUID(), Price: Double, Title: String, Category: MenuCategory, Ingredients: [Ingredient]) {
        self.id = id
        self.Price = Price
        self.Title = Title
        self.Category = Category
        self.Ingredients = Ingredients
    }
}

extension MenuViewViewModel{
    func mockData() {
        for i in 0..<12 {
            var ingredients: [Ingredient] = []
            for _ in 0 ..< 2 {
                ingredients.append(Ingredient.allCases.randomElement()!)
            }
            self.addMenuItem(MenuItem(Price: Double(Int.random(in: 100..<9999)), Title: "Food " + String(i) , Category: .Food, Ingredients: ingredients))
        }
        
        for i in 0..<8 {
            var ingredients: [Ingredient] = []
            for _ in 0 ..< 2 {
                ingredients.append(Ingredient.allCases.randomElement()!)
            }
            self.addMenuItem(MenuItem(Price: Double(Int.random(in: 100..<9999)), Title: "Drink " + String(i) , Category: .Drink, Ingredients: ingredients))
        }
        
        for i in 0..<4 {
            var ingredients: [Ingredient] = []
            for _ in 0 ..< 2 {
                ingredients.append(Ingredient.allCases.randomElement()!)
            }
            self.addMenuItem(MenuItem(Price: Double(Int.random(in: 100..<9999)), Title: "Dessert " + String(i) , Category: .Dessert, Ingredients: ingredients))
        }
    }
}

protocol MenuItemRequirements {
    var id: UUID { get }
    var Price: Double { get }
    var Title: String { get }
    var Category: MenuCategory { get }
    var ordersCount: Int { get set }
    var Ingredients: [Ingredient] { get set }
}
