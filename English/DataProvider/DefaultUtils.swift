//
//  DefaultUtils.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import UIKit

class DefaultUtils: NSObject {
    
    private enum Keys: String {
        case hideTranslate          = "hide_translate"
        case slectedSertchIndex     = "slected_sertch_index"
        case keyUserAppleID         = "UserDefaults_user_apple_id"
    }

    
    static let shared = DefaultUtils()
    
    private func obj(forKey: Keys) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    
    private func bool(forKey: Keys) -> Bool {
        return UserDefaults.standard.bool(forKey: forKey.rawValue)
    }
    
    private func int(forKey: Keys) -> Int {
        return UserDefaults.standard.integer(forKey: forKey.rawValue)
    }
    
    private func set(bool: Bool, forKey: Keys) {
        UserDefaults.standard.set(bool, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    private func set(int: Int, forKey: Keys) {
        UserDefaults.standard.set(int, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
    private func set(string: String?, forKey: Keys) {
        UserDefaults.standard.set(string, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    private func string(forKey: Keys) -> String?{
        return UserDefaults.standard.string(forKey: forKey.rawValue)
    }
    
    
    
    //MARK: Seartch
    
    var hideTranslate: Bool {
        set { set(bool: newValue, forKey: Keys.hideTranslate) }
        get { return bool(forKey: Keys.hideTranslate) }
    }
    
    var translateWay: Int {
        set { set(int: newValue, forKey: Keys.slectedSertchIndex) }
        get { return int(forKey: Keys.slectedSertchIndex) }
    }
    
    var userAppleID: String?{
        set { set(string: newValue, forKey: Keys.keyUserAppleID) }
        get { return string(forKey: Keys.keyUserAppleID) }
    }
    
}
