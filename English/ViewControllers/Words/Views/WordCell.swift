//
//  WordCell.swift
//  English
//
//  Created by Hudihka on 02/08/2021.
//

import Foundation
import UIKit

class WordCell: BaseCell {
	
   private(set) var labelWord: UILabel!
   var labelTarnlate: UILabel!
   private var buttonFave: UIButton!
   private let df = DefaultUtils.shared
   
    var presenter: WordsPresenterProtocol?
	
	var word: Word? {
		didSet{
			guard let word = word else { return }
			
			let image = word.favorit ? "favorit" : "not_favorit"
			buttonFave.setImage(UIImage(named: image), for: .normal)

            let alpha: CGFloat = df.hideTranslate ? 0 : 1

            textsLabels(word: word, alpha: alpha)
		}
	}

    func textsLabels(word: Word, alpha: CGFloat) {
        let russValue = df.translateWay == 0

        labelWord.text = russValue ? word.rusValue : word.engValue
        labelTarnlate.text = !russValue ? word.rusValue : word.engValue

        labelTarnlate.alpha = alpha
    }
   
   	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
	   super.init(style: style, reuseIdentifier: reuseIdentifier)
   }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
   @objc private func tapedLikeButton() {
	   presenter?.tapedLike(word: word)
   }
   
   func showAnimate(){

    if df.hideTranslate == false {
        return
    }
	   
	   UIView.animate(withDuration: 0.25, animations: {
		   self.animateAlpa(alpha: 1)
	   }) {[weak self] (compl) in
		   self?.hideAniate()
	   }
   }
   
   private func hideAniate(){
	   UIView.animate(withDuration: 0.25, delay: 0.9, options: [], animations: {
		   self.animateAlpa(alpha: 0)
	   })
   }

    func animateAlpa(alpha: CGFloat) {
        self.labelTarnlate.alpha = alpha
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
		   make.height.greaterThanOrEqualTo(40)
	   })
	   
	   labelTarnlate = UILabel()
	   labelTarnlate.numberOfLines = 0
	   labelTarnlate.textColor = UIColor.black
	   labelTarnlate.font = UIFont.systemFont(ofSize: 23)
	   self.contentView.addSubview(labelTarnlate)
	   labelTarnlate.snp.makeConstraints({ (make) in
		   make.top.equalTo(labelWord.snp.bottom).offset(7)
		   make.left.equalTo(labelWord.snp.left)
		   make.right.equalTo(-16)
           make.height.greaterThanOrEqualTo(25).priority(999)
           make.bottom.equalTo(contentView.snp.bottom).offset(-9)
	   })

   }
}
