//
//  BaseBlackButton.swift
//  English
//
//  Created by Константин Ирошников on 26.07.2021.
//

import UIKit

class BaseBlackButton: UIButton {

    override var isEnabled: Bool {
        didSet{
            self.backgroundColor = isEnabled ? UIColor.black : UIColor.black.withAlphaComponent(0.3)
        }
    }

    init(title: String?, selector: Selector, target: Any?) {
        super.init(frame: CGRect())

        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor.black
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.addTarget(target, action: selector, for: .touchUpInside)
        self.addRadius(number: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
