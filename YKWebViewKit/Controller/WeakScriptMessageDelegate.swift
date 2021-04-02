//
//  WeakScriptMessageDelegate.swift
//  NGOFund
//
//  Created by 袁科 on 2021/2/8.
//  Copyright © 2021 NGO. All rights reserved.
//

import Foundation
import WebKit

public class WeakScriptMessageDelegate: NSObject, WKScriptMessageHandler {
	
	public weak var scriptDelegate: WKScriptMessageHandler?
	
	public required init(with delegate: WKScriptMessageHandler) {
		self.scriptDelegate = delegate
	}
	
	public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
		self.scriptDelegate?.userContentController(userContentController, didReceive: message)
	}
}
