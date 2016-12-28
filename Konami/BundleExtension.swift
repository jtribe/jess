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
	
	static var isJessMode: Bool {
		guard let jess: Bool = Bundle.main.object(forInfoDictionaryKey: "JessActive") as? Bool else { return false }
		return jess
	}
}
