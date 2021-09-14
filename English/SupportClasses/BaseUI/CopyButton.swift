//
//  CopyButton.swift
//  English
//
//  Created by Константин Ирошников on 13.08.2021.
//

import UIKit

class CopyButton: UIButton {

    override var isEnabled: Bool {
        didSet{
            let color = isEnabled ? UIColor.black : UIColor.black.withAlphaComponent(0.2)
            setTitleColor(color, for: .normal)
        }
    }

    init(selector: Selector, target: Any?) {
        super.init(frame: CGRect())

        setTitle("COPY", for: .normal)
        backgroundColor = UIColor.clear
        isEnabled = false
        titleLabel?.textAlignment = .right
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        addTarget(target, action: selector, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
