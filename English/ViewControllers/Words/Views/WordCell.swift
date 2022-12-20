//
//  WordCell.swift
//  English
//
//  Created by Hudihka on 02/08/2021.
//

import Foundation
import UIKit

class WordCell: BaseCell {
    private var hideTranslate: Bool {
        DefaultUtils.shared.hideTranslate
    }
    
    var tapedWord: (Word) -> Void = { _ in }
    
    private let labelRus: UILabel = {
        let labelWord = UILabel()
        labelWord.textColor = UIColor.black
        labelWord.numberOfLines = 0
        labelWord.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return labelWord
    }()
    
    private let labelEngl: UILabel = {
        let labelTarnlate = UILabel()
        labelTarnlate.numberOfLines = 0
        labelTarnlate.textColor = UIColor.black
        labelTarnlate.font = UIFont.systemFont(ofSize: 23)
        
        return labelTarnlate
    }()
    
    private lazy var buttonFave: UIButton = {
        let buttonFave = UIButton()
        buttonFave.addTarget(self, action: #selector(tapedLikeButton), for: .touchUpInside)
        buttonFave.backgroundColor = UIColor.clear
        
        return buttonFave
    }()
    
    var word: Word? {
        didSet{
            guard let word = word else { return }
            
            let image = word.isFavorit ? "favorit" : "not_favorit"
            buttonFave.setImage(UIImage(named: image), for: .normal)
            
            let alpha: CGFloat = hideTranslate ? 0 : 1
            labelEngl.alpha = alpha
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func tapedLikeButton() {
        guard let word = word else {
            return
        }
        
        tapedWord(word)
    }
    
    func showAnimate(){
        
        if hideTranslate == false {
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
    
    private func animateAlpa(alpha: CGFloat) {
        self.labelEngl.alpha = alpha
    }
    
    override func desingUI(){
        
        contentView.addSubview(buttonFave)
        buttonFave.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(50)
            make.width.equalTo(50)
        })
        
        contentView.addSubview(labelRus)
        labelRus.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview().inset(Offsets.value16)
            make.height.equalTo(40)
        })
        
        contentView.addSubview(labelEngl)
        labelEngl.snp.makeConstraints({ (make) in
            make.top.equalTo(labelRus.snp.bottom).offset(7)
            make.bottom.left.right.equalToSuperview().inset(Offsets.value16)
        })
        
    }
}
