//OrangeVC.swift
/*
 * LK3DTouch
 * Created by penumutchu.prasad@gmail.com on 04/08/18
 * Is a product created by abnboys
 * For the LK3DTouch in the LK3DTouch
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class OrangeVC: UIViewController {
    
   var isItPresentingViaShortcutAction = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if traitCollection.forceTouchCapability == .available {
            
            registerForPreviewing(with: self, sourceView: self.view)
            
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isItPresentingViaShortcutAction {
            
            self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            
            let alertVc = UIAlertController.init(title: "Shortcut Action", message: nil, preferredStyle: .alert)
            
            alertVc.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (act) in
                
            }))
            
            self.present(alertVc, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    func presentAlert() {
        
        print("Alert in Orange will be presented")
    }
    
    
    static func configureDynamicShortcutItem() {
        
        let type = Bundle.main.bundleIdentifier! + ".Dynamic"
        
        let item = UIApplicationShortcutItem.init(type: type, localizedTitle: "Dynamic", localizedSubtitle: "This is dynamic action", icon: UIApplicationShortcutIcon.init(type: .compose), userInfo: nil)
        
        UIApplication.shared.shortcutItems = [item]
        
    }
    
    
    
}

extension OrangeVC: UIViewControllerPreviewingDelegate {
    
    //Peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        if let testVC = storyboard?.instantiateViewController(withIdentifier: "TestVC") as? TestVC {
            
            testVC.orngVC = self
            previewingContext.sourceRect = self.view.frame
            return testVC
        }
        
        return nil
    }
    
    //Pop
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        self.show(viewControllerToCommit, sender: self)
        
    }
    
    
    
}
