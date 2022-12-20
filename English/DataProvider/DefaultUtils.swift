//
//  DefaultUtils.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import UIKit

class DefaultUtils: NSObject {
    
    private enum Keys {
        case hideTranslate
        case slectedSertchIndex
        case wordId(id: String)
        
        var key: String {
            switch self {
            case .hideTranslate:
                return "hide_translate"
            case .slectedSertchIndex:
                return "slected_sertch_index"
            case .wordId(id: let id):
                return "wordId_\(id)"
            }
        }
    }

    
    static let shared = DefaultUtils()
    
    private func obj(forKey: Keys) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.key)
    }
    
    
    private func bool(forKey: Keys) -> Bool {
        return UserDefaults.standard.bool(forKey: forKey.key)
    }
    
    private func int(forKey: Keys) -> Int {
        return UserDefaults.standard.integer(forKey: forKey.key)
    }
    
    private func set(bool: Bool, forKey: Keys) {
        UserDefaults.standard.set(bool, forKey: forKey.key)
        UserDefaults.standard.synchronize()
    }
    
    private func set(int: Int, forKey: Keys) {
        UserDefaults.standard.set(int, forKey: forKey.key)
        UserDefaults.standard.synchronize()
    }
    
    
    private func set(string: String?, forKey: Keys) {
        UserDefaults.standard.set(string, forKey: forKey.key)
        UserDefaults.standard.synchronize()
    }
    
    private func string(forKey: Keys) -> String?{
        return UserDefaults.standard.string(forKey: forKey.key)
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
    
    func saveWordId(id: String, value: Bool) {
        let key = Keys.wordId(id: id)
        set(bool: value, forKey: key)
    }
    
    func getFavoritValueWord(id: String) -> Bool {
        let key = Keys.wordId(id: id)
        return bool(forKey: key)
    }
}
