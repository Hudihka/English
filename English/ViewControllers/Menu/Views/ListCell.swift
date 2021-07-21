//
//  ThemeCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ListCell: BaseCell {
    
    private var labelTheme: UILabel!
    private var labelCount: UILabel!
    private var countFavorite: UILabel!
    private var favoritImage: UIImageView!
    
    var list: List? {
        didSet{
            if let list = list {
                labelTheme.text = list.name
                labelCount.text = "\(list.count) слов"
                
                countFavorite.isHidden = true
                favoritImage.isHidden = true
                
                if list.countFavorit != 0{
                    settingsCountFavorite(countFavorit: list.countFavorit)
                }
            }
        }
    }
    
    private func settingsCountFavorite(countFavorit: Int){
        countFavorite.text = "\(countFavorit)"
        countFavorite.isHidden = false
        favoritImage.isHidden = false
    }

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func desingUI(){
		
		labelTheme = UILabel()
		labelTheme.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        labelTheme.numberOfLines = 0

		self.contentView.addSubview(labelTheme)
		labelTheme.snp.makeConstraints({ (make) in
            make.height.greaterThanOrEqualTo(33)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.top.equalTo(10)
		})
		
		
		labelCount = UILabel()
		labelCount.font = UIFont.systemFont(ofSize: 16)

		self.contentView.addSubview(labelCount)
		labelCount.snp.makeConstraints({ (make) in
			make.width.equalTo(85)
			make.top.equalTo(self.labelTheme.snp.bottom).offset(9)
            make.bottom.equalTo(contentView.snp.bottom).offset(-9)
			make.left.equalTo(self.labelTheme.snp.left)
		})
		
		favoritImage = UIImageView(image: UIImage(named: "favorit"))
		self.contentView.addSubview(favoritImage)
		favoritImage.snp.makeConstraints { (make) in
			make.height.equalTo(18)
			make.width.equalTo(18)
			make.centerY.equalTo(self.labelCount.snp.centerY)
			make.left.equalTo(self.labelCount.snp.right)
		}
		
		countFavorite = UILabel()
		countFavorite.font = UIFont.systemFont(ofSize: 16)
		self.contentView.addSubview(countFavorite)
		countFavorite.snp.makeConstraints({ (make) in
			make.height.equalTo(18)
			make.width.equalTo(85)
			make.centerY.equalTo(self.labelCount.snp.centerY)
			make.left.equalTo(self.favoritImage.snp.right).offset(8)
		})
		
	}

    
}
