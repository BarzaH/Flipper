//
//  LanguageSettingsController.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 31/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift



class LanguageSettingsController: LocalizableUIViewController {
    
    @IBOutlet weak var russianButton: UIButton!
    
    @IBOutlet weak var englishButton: UIButton!
    
    @IBAction func setEnglishLanguage(_ sender: UIButton) {
        Localize.setCurrentLanguage("en")
        localizeTexts(self.view)
    }
    
    @IBAction func setRussianLanguage(_ sender: UIButton) {
        Localize.setCurrentLanguage("ru")
        localizeTexts(self.view)
    }
    
    
}
