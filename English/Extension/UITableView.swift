//
//  UITableView.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import Foundation
import UIKit

extension UITableView {
	
	func didHighlightRowAt(indexPath: IndexPath) {
		guard let cell = self.cellForRow(at: indexPath) else {
			return
		}

		UIView.animate(withDuration: 0.25) {
			cell.transform = CGAffineTransform(scaleX: 0.97, y: 0.85)
		}
	}
	
	func didUnhighlightRowAt(indexPath: IndexPath) {
		guard let cell = self.cellForRow(at: indexPath) else {
			return
		}

		UIView.animate(withDuration: 0.25) {
			cell.transform = .identity
		}
	}
	
}
