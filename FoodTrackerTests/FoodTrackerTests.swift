//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by amitabh singh on 11/23/17.
//  Copyright © 2017 iStar. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Meal Class Tests
    
    // Confirm that a Meal class returns a Meal Object when passed valid parameters
    func testMealInitializationSucceeds(){
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the meal initializer fails when passed a negative rating or empty name
    func testMealInializationFails(){
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -2)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty name meal
        let emptyNameMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyNameMeal)
        
        // Rating exceeds maximum
        let excessRatingMeal = Meal.init(name: "Excess", photo: nil, rating: 6)
        XCTAssertNil(excessRatingMeal)
    }
}
