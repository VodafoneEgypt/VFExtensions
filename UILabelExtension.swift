//
//  UILabelExtension.swift
//  Ana Vodafone
//
//  Created by Ahmad Ragab on 1/28/19.
//

import UIKit

extension UILabel {
    
    func animateCharByCharForText(_ newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
    
    func animateLineByLineForText(_ string: String?, duration: TimeInterval) {
        let length: Int = string?.count ?? 0
        var paraStart: Int = 0
        var paraEnd: Int = 0
        var contentsEnd: Int = 0
        var displayedStringArray: [AnyHashable] = []
        var currentRange: NSRange
        
        while paraEnd < length {
            (string as NSString?)?.getParagraphStart(&paraStart, end: &paraEnd, contentsEnd: &contentsEnd, for: NSRange(location: paraEnd, length: 0))
            currentRange = NSRange(location: 0, length: contentsEnd)
            displayedStringArray.append((string as NSString?)?.substring(with: currentRange) ?? "")
        }
        
        let animation = CATransition()
        animation.duration = CFTimeInterval(duration)
        animation.type = .fade
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        var animationBlock: ((_ lineNumber: Int) -> Void)?
        var weakAnimationBlock: ((_ lineNumber: Int) -> Void)?
        animationBlock = { lineNumber in
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self.layer.add(animation, forKey: "changeTextTransition")
                self.text = displayedStringArray[lineNumber] as? String
                
                weakAnimationBlock = animationBlock
                let nextLine: Int = lineNumber + 1
                
                if nextLine < displayedStringArray.count {
                    weakAnimationBlock?(nextLine)
                }
            })
        }
        
        animationBlock?(0)
    }
    
    func animateUsage(startDate: Date, duration: Double, maxCount: Int32?, currentCount: Int32?) {
        
        if maxCount == nil || currentCount == nil {
            return
        }
        
        let now = Date()
        let timeElapsed = now.timeIntervalSince(startDate)
        var usage: Double = 0.0
        
        if timeElapsed > duration {
            if maxCount! >= 1024 {
                usage = Double(maxCount!) / 1024
                let formattedStr = String(format: "%.2f", usage)
                self.text = "\(formattedStr) GB"
            } else {
                usage = Double(maxCount!)
                self.text = "\(usage) MB"
            }
        } else {
            let percentage = timeElapsed / duration
            let value = percentage * Double(maxCount! - currentCount!)
            self.text = String(format: "%.2f", value)
        }
    }
}
