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

class LocalizedUIViewController: UIViewController{
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
            case is UITextField:
                (view as! UITextField).text = (view as! UITextField).text?.localized()
            case is UIButton:
                (view as! UIButton).setTitle((view as! UIButton).currentTitle?.localized(), for: .normal)
            case is UILabel:
                (view as! UILabel).text = (view as! UILabel).text?.localized()
            default:
                localizeTexts(view)
            }
            
            
        }
    }
    
    func replaceNavBarButtons(){
        let button = UIBarButtonItem()
        button.title = "Back".localized()
       
        for vc in self.navigationController!.viewControllers{
            vc.navigationItem.backBarButtonItem = button
        }
        
        
    }
}

