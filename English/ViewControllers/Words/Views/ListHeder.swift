//
//  ListHeder.swift
//  English
//
//  Created by Худышка К on 20.12.2022.
//

import Foundation
import UIKit

final class ListHeder: UITableViewHeaderFooterView {
    
    private let labelNumber: UILabel = {
        let labelWord = UILabel()
        labelWord.textColor = UIColor.black
        labelWord.numberOfLines = 0
        labelWord.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return labelWord
    }()
    
    private let labelInfo: UILabel = {
        let labelTarnlate = UILabel()
        labelTarnlate.numberOfLines = 0
        labelTarnlate.textColor = UIColor.black
        labelTarnlate.font = UIFont.systemFont(ofSize: 23)
        
        return labelTarnlate
    }()
    
    var list: List? {
        didSet {
            guard let list = list else {
                return
            }
            
            labelNumber.text = "Секция \(list.number)"
            labelInfo.text = list.description
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

    private func desingUI() {
        backgroundColor = UIColor.white

        addSubview(labelNumber)
        labelNumber.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview().offset(Offsets.value16)
            make.bottom.left.right.equalToSuperview().offset(Offsets.value16)
        })
        
        addSubview(labelInfo)
        labelInfo.snp.makeConstraints({ (make) in
            make.bottom.left.right.equalToSuperview().offset(Offsets.value16)
            make.top.equalTo(labelNumber.snp.bottom).offset(Offsets.value16)
        })
    }
}
