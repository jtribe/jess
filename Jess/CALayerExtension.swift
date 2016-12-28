//
//  CALayerExtension.swift
//  Ditto
//
//  Created by Ben on 19/11/2016.
//  Copyright © 2016 Ben. All rights reserved.
//

import Foundation
import UIKit

typealias Callback = (() -> Void)

extension CALayer {
	func shake(_ completion: Callback? = nil) {
		transform = CATransform3DMakeTranslation(80, 0, 0)
		
		UIView.animate(withDuration: 0.9, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
			self.transform = CATransform3DIdentity
		}, completion: { _ in
				completion?()
		})
	}
	
	func shrink() {
		transform = CATransform3DMakeScale(0.9, 0.9, 0.9)
		opacity = 0.0
	}
	
	func restore() {
		transform = CATransform3DIdentity
		opacity = 1.0
	}
}
