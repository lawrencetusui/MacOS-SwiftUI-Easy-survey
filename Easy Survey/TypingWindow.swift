//
//  TypingWindow.swift
//  SpeedMaths
//
//  Created by Lawrence Tsui on 21/1/21.
//

import Cocoa

extension Notification.Name{
    static let enterNumber = Notification.Name("enterNumber")
    static let removeNumber  = Notification.Name("removeNumber")
    static let submitAnswer  = Notification.Name("submitNumber")
}
class TypingWindow: NSWindow {
    override func keyDown(with event: NSEvent){
        if event.keyCode == 51{
            NotificationCenter.default.post(name: .removeNumber, object: nil)
        } else if event.keyCode == 36{
            NotificationCenter.default.post(name: .submitAnswer, object: nil)
            
        }else{
            guard let characters = event.characters else { return }
            if let number = Int(characters){
                NotificationCenter.default.post(name: .enterNumber, object: number)
            }
        }
    }
}

