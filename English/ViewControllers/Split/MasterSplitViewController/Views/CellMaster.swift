//
//  CellMaster.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation
import UIKit

class CellMaster: BaseCell {
    
    private var labelText: UILabel!
    private var labelTranslate: UILabel!
	
	var rusEngl: Bool = true
    
    var wordAnswer: WordAnswer?{
        didSet{
			guard let word = wordAnswer?.word else { return }
            labelText.text      = rusEngl ? word.rusValue : word.engValue
			labelTranslate.text = rusEngl ? word.rusValue : word.engValue
			
			colorContent()
			guard let answer = wordAnswer?.answer else { return }
			contentView.backgroundColor = answer ? .green : .red
			
			if answer == false {
				self.labelText.textColor      = .white
				self.labelTranslate.textColor = .white
			}
        }
    }
    
    private func colorContent(){
		contentView.backgroundColor = .white
        labelText.textColor         = .black
        labelTranslate.textColor    = .black
        labelTranslate.isHidden     = true
    }
	
	override func desingUI(){
		
		labelText = UILabel()
		labelText.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		self.contentView.addSubview(labelText)
		
		labelText.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(21)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(15)
		})
		
		
		labelTranslate = UILabel()
		labelTranslate.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		self.contentView.addSubview(labelTranslate)
		
		labelTranslate.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(15)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(labelText.snp.bottom).offset(5)
			make.bottom.equalTo(-11)
		})
		
		colorContent()
	}
    
    
    
}
