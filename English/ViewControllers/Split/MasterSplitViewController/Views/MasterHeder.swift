//
//  MasterHeder.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import UIKit

class MasterHeder: UITableViewHeaderFooterView {

    private var labelAll: UILabel!
    private var labelTrue: UILabel!
    private var labelFolse: UILabel!
    
    var countTrue: Int = 0
    var countFalse: Int = 0
    
    var count: Int = 0 {
        didSet{
			labelAll.text = HederMasterText.countAll
//			"\(countTrue + countFalse) из \(count)"
			
			labelTrue.isHidden = countTrue == 0
			labelTrue.text = "\(countTrue) +"
			
            labelFolse.isHidden = countFalse == 0
            labelFolse.text = "\(countFalse) -"
        }
    }
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		desingUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func desingUI(){
		self.contentView.backgroundColor = grayColor
		
		labelAll = UILabel()
		labelAll.font = UIFont.systemFont(ofSize: 17, weight: .medium)
		self.contentView.addSubview(labelAll)
		
		labelAll.snp.makeConstraints({ (make) in
			make.height.equalTo(21)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.top.equalTo(15)
		})
		
		labelTrue = UILabel()
		labelTrue.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		labelTrue.textColor = UIColor.green
		self.contentView.addSubview(labelTrue)
		
		labelFolse = UILabel()
		labelFolse.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		labelFolse.textColor = UIColor.red
		self.contentView.addSubview(labelFolse)
		
		
		labelTrue.snp.makeConstraints({ (make) in
			make.height.equalTo(20)
			make.top.equalTo(labelAll.snp.bottom).offset(13)
			make.left.equalTo(labelAll.snp.left)
			make.bottom.equalTo(-15)
			make.width.equalTo(labelFolse.snp.width)
		})
		
		labelFolse.snp.makeConstraints({ (make) in
			make.top.equalTo(labelTrue.snp.top)
			make.height.equalTo(labelTrue.snp.height)
			make.right.equalTo(-16)
			make.left.equalTo(labelTrue.snp.right).offset(16)
			make.width.equalTo(labelTrue.snp.width)
		})
		
	}

}
