//
//  Handler.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import WebKit
import PromiseKit

public class YKScriptHandler: WebViewScriptHandler {
	
	public var scripts: [ScriptAble] = []
	
	public var web: AssociateWeb
	
	public init(with web: AssociateWeb) {
		self.web = web
		setScripts()
	}
	
	func setScripts() {
		let test = TestScript(associate: web)
		scripts.append(test)
	}

}
