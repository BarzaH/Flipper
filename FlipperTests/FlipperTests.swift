//
//  FlipperTests.swift
//  FlipperTests
//
//  Created by Mergaliev Ibragim on 29/04/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import XCTest
//import Localized_Strings
@testable import Flipper

class FlipperTests: XCTestCase {
    var gvc: GameViewController!
    var storyboard: UIStoryboard!
    
    override func setUp() {
        super.setUp()
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        gvc = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        _ = gvc.view
    }
    
    override func tearDown() {
        gvc = nil
        super.tearDown()
    }
    
    func testFlipsCountIncreasesOnButtonClick() {
        //given
        let initialCount = gvc.game.flips
        
        //when
        gvc.cardButtons[0].sendActions(for: .touchUpInside)
        
        //assert
        let currentCount = gvc.game.flips
        XCTAssert(initialCount + 1 == currentCount)
    }
    
    func testBackgrroundImageChanges() {
        //given
        let initialImage = gvc.cardButtons[0].backgroundImage(for: .normal)
        let pdc = storyboard.instantiateViewController(withIdentifier: "PhotoDownloadController") as! PhotoDownloadController
        _ = pdc.view
        
        //when
        pdc.downloadPhoto(pdc)
        pdc.save(pdc)
        
        
        //assert
        let currentImage = gvc.cardButtons[0].backgroundImage(for: .normal)
        XCTAssert(initialImage != currentImage)
    }
    
    func testLanguageLocalization() {
        //given
        let initialText = gvc.flipsLabel.text!
        let lsc = storyboard.instantiateViewController(withIdentifier: "LanguageSettingsController") as! LanguageSettingsController
        _ = lsc.view
        
        //when
        lsc.setRussianLanguage(lsc.russianButton)
        gvc.viewWillAppear(true)
        
        //assert
        let currentText = gvc.flipsLabel.text
        XCTAssert(initialText != currentText)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
