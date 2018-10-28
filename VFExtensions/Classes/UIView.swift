//
//  UIView.swift
//  Ana Vodafone
//
//  Created by Khaled saad on 5/23/18.
//  Copyright © 2018 Vodafone Egypt. All rights reserved.
//

import Foundation

import UIKit
import MapKit


extension UINavigationController {
    func popToViewController(backIndex : Int , animated : Bool)  {
        
        let index = self.viewControllers.count - backIndex - 1
        self.popToViewController(self.viewControllers[index], animated: animated)
        
    }
    func popToViewController(identifier : String , animated : Bool)  {
        
        for controller in self.viewControllers {
            if identifier == controller.restorationIdentifier {
                self.popToViewController(controller, animated: animated)
                return
            }
        }
    }
    func containsController(identifier : String) -> Bool {
        
        for controller in self.viewControllers {
            if identifier == controller.restorationIdentifier {
                return true
            }
        }
        return false
    }
    func controller(identifier : String) -> UIViewController? {
        
        for controller in self.viewControllers {
            if identifier == controller.restorationIdentifier {
                return controller
            }
        }
        return nil
    }
}
extension UIView {
    
    func setShadow(color : UIColor = .lightGray,opacity : Float  = 1,radius : CGFloat = 5) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
//        self.layer.shouldRasterize = true
    }
    func setRounded(isRounded : Bool)  {
        self.clipsToBounds = true
        self.layer.cornerRadius = isRounded ? self.frame.size.height/2 : 0
    }
    func setCorner(cornerRadius : Bool)  {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius ? self.frame.size.height/12 : 0
    }
    func setCornerByValue(cornerRadius : Bool , value : CGFloat)  {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius ? self.frame.size.height/value : 0
    }
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.layer.cornerRadius = self.layer.cornerRadius
        blurEffectView.clipsToBounds = true
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        self.sendSubview(toBack: blurEffectView)
    }

}
extension UIRefreshControl {
    func programaticallyBeginRefreshing(in scrollView: UIScrollView) {
        beginRefreshing()
        let offsetPoint = CGPoint.init(x: 0, y: -frame.size.height)
        scrollView.setContentOffset(offsetPoint, animated: true)
    }
}


