//
//  Vibro.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import AudioToolbox

class Vibro: NSObject {
    static func strong() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }

    static func weak() {
        AudioServicesPlaySystemSound(1_520)
    }

}
