//
//  KonamiMode.swift
//  Konami
//
//  Created by Ben on 1/12/2016.
//  Copyright © 2016 Ben. All rights reserved.
//

import Foundation
import UIKit

protocol Konami {
	func allowKonamiMode() -> Bool
	
	func correct()
	func incorrect()
}

class KonamiEngine {
	
	static var sharedInstance: KonamiEngine = KonamiEngine()
	var puzzle: [Int] = [2, 1, 8]
	var answer: [Int] = []
	var delegate: Konami?
	
	fileprivate var popup: UIView?
	fileprivate var build: UILabel?
	
	fileprivate init() {}
	
	var swipeGestures: [UISwipeGestureRecognizer] {
		let up = UISwipeGestureRecognizer(target: self, action: #selector(KonamiEngine.checkDirection(recognizer:)))
		up.direction = .up
		
		let down = UISwipeGestureRecognizer(target: self, action: #selector(KonamiEngine.checkDirection(recognizer:)))
		down.direction = .down
		
		let left = UISwipeGestureRecognizer(target: self, action: #selector(KonamiEngine.checkDirection(recognizer:)))
		left.direction = .left
		
		let right = UISwipeGestureRecognizer(target: self, action: #selector(KonamiEngine.checkDirection(recognizer:)))
		right.direction = .right
		
		return [up, down, left, right]
	}
	
	func showBuildPopup() {
		popup = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
		popup?.backgroundColor = UIColor.black.withAlphaComponent(0.75)
		popup?.layer.cornerRadius = 10
		popup?.layer.masksToBounds = true
		
		build = UILabel(frame: popup?.frame ?? .zero)
		build?.textColor = .white
		build?.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
		build?.textAlignment = .center
		build?.text = String(format: "%@ (%@)", Bundle.appVersion, Bundle.appBuild)
		
		popup?.alpha = 0.0
		popup?.addSubview(build!)
		popup?.layer.shrink()
		
		UIApplication.shared.keyWindow?.addSubview(popup!)
		
		popup?.center = UIApplication.shared.keyWindow!.center
		
		popup?.animate({
			self.popup?.layer.restore()
		}, callback: nil)
	}
	
	func hidePopup() {
		popup?.animate(withDelay: 2.0, {
			self.popup?.layer.shrink()
		}, callback: {
			self.popup?.removeFromSuperview()
			self.build?.removeFromSuperview()
			self.popup = nil
			self.build = nil
		})
	}
	
	@objc fileprivate func checkDirection(recognizer: UISwipeGestureRecognizer) {
		print(recognizer.direction.rawValue)
		if recognizer.state == .ended {
			if answer.count != puzzle.count {
				answer.append(Int(recognizer.direction.rawValue))
			}
			
			if answer.count == puzzle.count {
				if answer == puzzle {
					answer = []
					delegate?.correct()
				} else {
					answer = []
					delegate?.incorrect()
				}
			}
		}
	}
}

extension Konami where Self: UIViewController {
	
	func enableKonamiMode() {
		KonamiEngine.sharedInstance.swipeGestures.forEach({ view.addGestureRecognizer($0) })
		KonamiEngine.sharedInstance.delegate = self
	}
	
	func disableKonamiMode() {
		view.gestureRecognizers?.forEach({
			if let swipe = $0 as? UISwipeGestureRecognizer {
				view.removeGestureRecognizer(swipe)
			}
		})
	}
	
	func correct() {
		if allowKonamiMode() {
			performSegue(withIdentifier: "DebugViewControllerSegue", sender: nil)
		} else {
			KonamiEngine.sharedInstance.showBuildPopup()
			KonamiEngine.sharedInstance.hidePopup()
		}
	}
	
	func incorrect() {
		if allowKonamiMode() {
			view.layer.shake()
		}
	}
	
}
