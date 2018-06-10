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

class LanguageSettingsController: LocalizedUIViewController {
    
    @IBOutlet weak var russianButton: UIButton!
    
    @IBOutlet weak var englishButton: UIButton!
    
    @IBAction func setEnglishLanguage(_ sender: UIButton) {
        Localize.setCurrentLanguage("en")
        replaceNavBarButtons()
        russianButton.setTitle("Russian".localized(), for: .normal)
        englishButton.setTitle("English".localized(), for: .normal)
    }
    
    @IBAction func setRussianLanguage(_ sender: UIButton) {
        Localize.setCurrentLanguage("ru")
        replaceNavBarButtons()
        russianButton.setTitle("Russian".localized(), for: .normal)
        englishButton.setTitle("English".localized(), for: .normal)
    }
    
    
}
