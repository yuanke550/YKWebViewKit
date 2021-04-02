//
//  WebViewController+WKNavigationDelegate.swift
//  HXSDermatologyUserClient
//
//  Created by 袁科 on 2021/1/21.
//  Copyright © 2021 NGO. All rights reserved.
//

import Foundation
import WebKit

extension WebViewController: WKNavigationDelegate {
	public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		Loading.showLoading(msg: "加载中...", to: self.view)
	}
	public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		Loading.hideLoading(from: self.view)
	}
	public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		Loading.hideLoading(from: self.view)
	}
	
	public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
		Loading.hideLoading(from: self.view)
	}
}
