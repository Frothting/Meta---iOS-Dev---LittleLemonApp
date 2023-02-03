//
//  LittleLemonAppTests.swift
//  LittleLemonAppTests
//
//  Created by Christian  Cordy on 2/3/23.
//

import XCTest
@testable import LittleLemonApp

final class LittleLemonAppTests: XCTestCase {

    func test_MenuItem_TitleCheckAfterInitialization(){
        let newMenuItem = MenuItem(Price: 10, Title: "testTitle", Category: .Dessert, Ingredients: [Ingredient.Broccoli])
        
        XCTAssertEqual("testTitle", newMenuItem.Title)
        XCTAssertEqual(Ingredient.Broccoli, newMenuItem.Ingredients.first)
    }
    
    

}
