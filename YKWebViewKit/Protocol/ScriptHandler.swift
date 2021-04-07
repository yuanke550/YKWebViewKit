//
//  ScriptHandler.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import WebKit

public protocol WebViewScriptHandler {
	/// 脚本组
	var scripts: [ScriptAble] { get set }
	/// 关联web
	var web: AssociateWeb { get set }
	
	func setScripts()
}

extension WebViewScriptHandler {
	
	/// script查询
	/// - Parameter receiveName: 方法名
	/// - Returns: script
	func getScriptBy(receiveName: String) -> ScriptAble? {
		for script in self.scripts {
			if script.receive.functionName == receiveName {
				return script;
			}
		}
		return nil;
	}
	
	/// script查询
	/// - Parameter replyName: 方法名
	/// - Returns: script
	func getScriptBy(replyName: String) -> ScriptAble? {
		for script in self.scripts {
			if script.reply?.functionName == replyName {
				return script;
			}
		}
		return nil;
	}
	
	public func receive(_ name: String, _ body: Any, from webView: WKWebView) {
		guard let script = self.getScriptBy(receiveName: name) else { return }
		let pramStr = (body as? String) ?? "";
		let _ = script.receive(body: pramStr)
	}

	public func reply(_ javaScriptString: String, to webView: WKWebView, completionHandler: ((Any?, Error?) -> Void)?) {
		webView.evaluateJavaScript(javaScriptString, completionHandler: completionHandler);
	}
}
