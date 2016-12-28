//
//  Constants.swift
//  Konami
//
//  Created by Ben on 1/12/2016.
//  Copyright © 2016 Ben. All rights reserved.
//

import Foundation
import UIKit

typealias Animations = () -> Void

extension UIView {
	static let standardDuration: Double = 0.5
	static let quickDuration: Double = 0.2
	
	func spring(withDelay delay: Double = 0.0, animations: @escaping Animations, callback: (() -> Void)? = nil) {
		UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
			animations()
		}, completion: { _ in
			callback?()
		})
	}
	
	func animate(withDelay delay: Double? = 0.0, _ animations: @escaping Animations, callback: (() -> Void)? = nil) {
		UIView.animate(withDuration: 0.5, delay: delay ?? 0.0, options: .curveEaseInOut, animations: {
			animations()
		}, completion: { _ in
			callback?()
		})
	}
}
