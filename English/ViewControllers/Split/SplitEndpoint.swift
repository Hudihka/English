//
//  SplitEndpoint.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation

enum SplitEndpoint {
	enum MasterText: String {
		case leftBBItem = "Отмена"
	}
	
	enum HederMasterText {
		case countAll(countTrue: Int, countFalse: Int, count: Int)
		case countTrue(Int)
		case countFalse(Int)
		
		var text: String {
			switch self {
			case .countAll(let countTrue, let countFalse, let count):
				return "\(countTrue + countFalse) из \(count)"
			case .countTrue(let count) :
				return "\(count) +"
			case .countFalse(let count) :
				return "\(count) -"
			}
		}
	}
}


