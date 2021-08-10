//
//  LoadProfileRouter.swift
//  English
//
//  Created by Константин Ирошников on 08.07.2021.
//

import Foundation
import UIKit

protocol LoadProfileProtocol: AnyObject {
    func windowChange()
}

class LoadProfileRouter: LoadProfileProtocol{

    func windowChange() {

        for word in AllThemes.allWords{
            FirebaseData.shared.createWord(newWord: word)
        }

        for word in AllThemes.allLists{
            FirebaseData.shared.createList(list: word)
        }

        let VC = DI.menuViewController()
        UIWindow.transitionRoot(to: VC)
    }
}
