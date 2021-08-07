//
//  ChekWordCell.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation
import UIKit

class ChekWordCell: BaseCell {

    private var labelText: UILabel!

    var text: String?{
        didSet{
            guard let text = text else { return }
            labelText.text      = text
        }
    }

    override func desingUI(){

        labelText = UILabel()
        labelText.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        self.contentView.addSubview(labelText)

        labelText.snp.makeConstraints({ (make) in
            make.height.greaterThanOrEqualTo(26)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(13)
            make.bottom.equalTo(-13)
        })

    }

}
