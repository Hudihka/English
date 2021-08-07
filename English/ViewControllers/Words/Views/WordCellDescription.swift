//
//  WordCellDescription.swift
//  English
//
//  Created by Константин Ирошников on 04.08.2021.
//

import Foundation
import UIKit

class WordCellDescription: WordCell {

   private var labelDescription: UILabel!

    override func textsLabels(word: Word, alpha: CGFloat) {
        super.textsLabels(word: word, alpha: alpha)

        labelDescription?.alpha = alpha
        labelDescription?.text = word.descript
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
   }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func animateAlpa(alpha: CGFloat) {
        super.animateAlpa(alpha: alpha)
        self.labelDescription.alpha = alpha
    }


   override func desingUI(){
    super.desingUI()

       labelTarnlate.snp.removeConstraints()
        labelTarnlate.snp.makeConstraints({ (make) in
           make.top.equalTo(labelWord.snp.bottom).offset(7)
           make.left.equalTo(labelWord.snp.left)
           make.right.equalTo(-16)
           make.height.greaterThanOrEqualTo(25).priority(999)
       })

        labelDescription = UILabel()
        labelDescription.numberOfLines = 0
        labelDescription.textColor = UIColor.black
        labelDescription.font = UIFont.systemFont(ofSize: 17)
        self.contentView.addSubview(labelDescription)
        labelDescription.snp.makeConstraints({ (make) in
            make.top.equalTo(labelTarnlate.snp.bottom).offset(10)
            make.left.equalTo(labelWord.snp.left)
            make.right.equalTo(-16)
            make.height.greaterThanOrEqualTo(18).priority(750)
            make.bottom.equalTo(contentView.snp.bottom).offset(-9)
        })
   }
}
