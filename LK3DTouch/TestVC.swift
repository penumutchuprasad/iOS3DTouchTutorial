//TestVC.swift
/*
 * LK3DTouch
 * Created by penumutchu.prasad@gmail.com on 05/08/18
 * Is a product created by abnboys
 * For the LK3DTouch in the LK3DTouch
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class TestVC: UIViewController {
    
    
    weak var orngVC: OrangeVC?
    
    override var previewActionItems: [UIPreviewActionItem] {
        
        let shareAction = UIPreviewAction.init(title: "share", style: .default) { (shareAction, viewController) in
            
            
            if let orngVC = self.orngVC {
                
                orngVC.presentAlert()
            }
        }
        
        return [shareAction]
    }

    override func viewDidLoad() {
        super.viewDidLoad()



    }

   
   
    
    

}
