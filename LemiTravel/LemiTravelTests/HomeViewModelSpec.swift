//
//  HomeViewModelSpec.swift
//  LemiTravelTests
//
//  Created by Glenn Von C. Posadas on 28/05/2019.
//  Copyright © 2019 Glenn Von C. Posadas. All rights reserved.
//

@testable import LemiTravel
import Quick
import Nimble

class HomeViewModelSpec: QuickSpec {
    /// Mock class conforming to ```HomeDelegate```
    class TestHomeDelegate: NSObject, HomeDelegate {
        var showCityListWasCalled = false
        
        func showCityList() {
            self.showCityListWasCalled = true
        }
    }
    
    override func spec() {
        describe("Tests for HomeViewModel") {
            
            var homeDelegate: TestHomeDelegate?
            var viewModel: HomeViewModel?
            
            beforeEach {
                homeDelegate = TestHomeDelegate()
                viewModel = HomeViewModel(homeController: homeDelegate)
            }
            
            context("Tests the whole viewModel.") {
                
                it("tests the select city button") {
                    
                    // Assert
                    expect(viewModel?.delegate).notTo(beNil())
                    
                    // Call the viewModel selector
                    viewModel?.selectCity()
                    
                    // Assert
                    expect(homeDelegate?.showCityListWasCalled).to(equal(true))
                }
            }
        }
    }
}


