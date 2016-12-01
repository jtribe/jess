//
//  BundleExtension.swift
//  Konami
//
//  Created by Ben on 1/12/2016.
//  Copyright © 2016 Ben. All rights reserved.
//

import Foundation

extension Bundle {
	static var appVersion: String {
		return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
	}
	
	static var appBuild: String {
		return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
	}
	
	static var isKonamiMode: Bool {
		guard let konami: Bool = Bundle.main.object(forInfoDictionaryKey: "KonamiModeActive") as? Bool else { return false }
		return konami
	}
}
