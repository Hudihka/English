//
//  FavoriteWords.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class FavoriteWords: BaseCell {
    
    private var labelFavorite: UILabel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func desingUI(){
		
		labelFavorite = UILabel()
		labelFavorite.text = "Выбранные слова"
		labelFavorite.textColor = UIColor.black
		labelFavorite.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        labelFavorite.textAlignment = .center

		self.contentView.addSubview(labelFavorite)
		labelFavorite.snp.makeConstraints({ (make) in
			make.height.equalTo(30)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.top.equalTo(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
		})
		
	}


    
}
