//
//  ViewController.swift
//  Konami
//
//  Created by Ben on 1/12/2016.
//  Copyright © 2016 Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Konami {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		enableKonamiMode()
	}
	
	@IBAction func unwindFromDebug(segue: UIStoryboardSegue) {
		print("returned!")
	}
	
	func allowKonamiMode() -> Bool {
		return true
	}
	
}

