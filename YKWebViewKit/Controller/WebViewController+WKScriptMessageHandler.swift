//
//  WebViewController+WKScriptMessageHandler.swift
//  HXSDermatologyUserClient
//
//  Created by 袁科 on 2021/1/21.
//  Copyright © 2021 NGO. All rights reserved.
//

import Foundation
import WebKit

extension WebViewController: WKScriptMessageHandler {
	public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
		self.scriptHandler?.receive(message.name, message.body, from: webView);
	}
}
