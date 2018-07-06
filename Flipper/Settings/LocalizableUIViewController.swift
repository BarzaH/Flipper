//
//  File.swift
//  Flipper
//
//  Created by Mergaliev Ibragim on 31/05/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift

class LocalizableUIViewController: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let button = UIBarButtonItem()
        button.title = "Back".localized()
        self.navigationItem.backBarButtonItem = button
        
        localizeTexts(self.view)
        
    }
    
    func localizeTexts(_ rootView: UIView)
    {
        for view in rootView.subviews{
            
            switch(view)
            {
//            case is UITextField:
//                (view as! UITextField).text = view.baseText.localized()
            case is UIButton:
                (view as! UIButton).setTitle(view.baseText.localized(), for: .normal)
            case is UILabel:
                (view as! UILabel).text = view.baseText.localized()
            default:
                localizeTexts(view)
            }
        
        }
        
        replaceNavBarButtons()
    }
    
    func replaceNavBarButtons(){
        let button = UIBarButtonItem()
        button.title = "Back".localized()
       
        if let vcs = self.navigationController?.viewControllers{
        for vc in vcs{
            vc.navigationItem.backBarButtonItem = button
        }
        }
        
    }
}

