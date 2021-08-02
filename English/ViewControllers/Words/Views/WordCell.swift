//
//  WordCell.swift
//  English
//
//  Created by Hudihka on 02/08/2021.
//

import Foundation
import UIKit

class WordCell: BaseCell {
	
   
   private var labelWord: UILabel!
   private var labelTarnlate: UILabel!
   private var labelDescription: UILabel!
   private var buttonFave: UIButton!
   private let df = DefaultUtils.shared
   
   var tupl: (word: Word, russValue: Bool, hideTranslate: Bool)?{
	   didSet{
		   settingsCell()
	   }
   }
	
	var word: Word? {
		didSet{
			guard let word = word else { return }
			
			labelDescription.text = word.descript
			
			let image = word.favorit ? "favorit" : "not_favorit"
			buttonFave.setImage(UIImage(named: image), for: .normal)
			
			let russValue = df.translateWay == 0
			
			labelWord.text = russValue ? word.rusValue : word.engValue
			labelTarnlate.text = !russValue ? word.rusValue : word.engValue

            let alpha: CGFloat = df.hideTranslate ? 0 : 1

			labelTarnlate.alpha = alpha
			labelDescription.alpha = alpha
		}
	}
	
   
   	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
	   super.init(style: style, reuseIdentifier: reuseIdentifier)
   }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
   @objc private func tapedLikeButton() {
//	   presenter?.tapedLike(word: self.tupl?.word)
   }
   
   private func settingsCell(){
	   
	   guard let tupl = tupl else {
		   return
	   }
	   
	   labelWord.text = tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
	   labelTarnlate.text = !tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
	   
	   labelDescription.text = tupl.word.descript
	   
	   labelTarnlate.alpha = tupl.hideTranslate ? 0 : 1
	   labelDescription.alpha = tupl.hideTranslate ? 0 : 1
	   
	   let image = tupl.word.favorit ? "favorit" : "not_favorit"
	   buttonFave.setImage(UIImage(named: image), for: .normal)
	   
	   
   }
   
   func showAnimate(){

    if df.hideTranslate == false {
        return
    }
	   
	   UIView.animate(withDuration: 0.25, animations: {
		   self.labelTarnlate.alpha = 1
		   self.labelDescription.alpha = 1
	   }) {[weak self] (compl) in
		   self?.hideAniate()
	   }
   }
   
   private func hideAniate(){
	   UIView.animate(withDuration: 0.25, delay: 0.9, options: [], animations: {
		   self.labelTarnlate.alpha = 0
		   self.labelDescription.alpha = 0
	   }) { (_) in
		   ///
	   }
   }
   
   
   override func desingUI(){
	   
	   buttonFave = UIButton()
	   buttonFave.addTarget(self, action: #selector(tapedLikeButton), for: .touchUpInside)
	   buttonFave.backgroundColor = UIColor.clear
	   self.contentView.addSubview(buttonFave)
	   
	   buttonFave.snp.makeConstraints({ (make) in
		   make.top.equalTo(0)
		   make.right.equalTo(0)
		   make.height.equalTo(50)
		   make.width.equalTo(50)
	   })
	   
	   
	   labelWord = UILabel()
	   labelWord.textColor = UIColor.black
	   labelWord.numberOfLines = 0
	   labelWord.font = UIFont.systemFont(ofSize: 32, weight: .bold)
	   self.contentView.addSubview(labelWord)
	   labelWord.snp.makeConstraints({ (make) in
		   make.top.equalTo(5)
		   make.left.equalTo(20)
		   make.right.equalTo(buttonFave.snp.left)
		   make.height.greaterThanOrEqualTo(50)
	   })
	   
	   labelTarnlate = UILabel()
	   labelTarnlate.numberOfLines = 0
	   labelTarnlate.textColor = UIColor.black
	   labelTarnlate.font = UIFont.systemFont(ofSize: 23)
	   self.contentView.addSubview(labelTarnlate)
	   labelTarnlate.snp.makeConstraints({ (make) in
		   make.top.equalTo(labelWord.snp.bottom).offset(-7)
		   make.left.equalTo(labelWord.snp.left)
		   make.right.equalTo(-16)
		   make.height.greaterThanOrEqualTo(27)
		   make.height.equalTo(27).priority(750)
	   })
	   
	   
	   labelDescription = UILabel()
	   labelDescription.numberOfLines = 0
	   labelDescription.textColor = UIColor.black
	   labelDescription.font = UIFont.systemFont(ofSize: 17)
	   self.contentView.addSubview(labelDescription)
	   labelDescription.snp.makeConstraints({ (make) in
		   make.top.equalTo(labelTarnlate.snp.bottom).offset(-20)
		   make.left.equalTo(labelWord.snp.left)
		   make.right.equalTo(0)
		   make.height.greaterThanOrEqualTo(21)
		   make.height.equalTo(21).priority(750)
	   })
   }
}
