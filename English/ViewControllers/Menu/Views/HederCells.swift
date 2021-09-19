//
//  HederCells.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class HederCells: UITableViewHeaderFooterView {

    private var titleLable = UILabel.labelInfinity(text: MenuEndpointsEnum.CellText.favorit.text,
                                                   font: EnumFont.regular(15),
                                                   aligment: .right)
    
    var text: String? {
        didSet{
            titleLable.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		desingUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func desingUI(){
		
        contentView.backgroundColor = grayColor

		self.contentView.addSubview(titleLable)
		titleLable.snp.makeConstraints({ (make) in
			make.height.equalTo(20)
			make.width.greaterThanOrEqualTo(42)
			
			make.right.equalTo(-20)
			make.top.equalTo(10)
			make.bottom.equalTo(-10)
		})
		
	}

}
