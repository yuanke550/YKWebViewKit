//
//  Reply.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import PromiseKit

public protocol ReplyScript: class, Script {
	
}

public protocol ReplyScriptAble: ReplyScript {
	/// 参数编码
	func encodeParm() -> String
	
}

extension ReplyScriptAble {
	
	/// 脚本拼接
	/// - Returns: 用于交互的脚本字符串
	func getReplyString() -> String {
		return "\(functionName)('\(encodeParm())')"
	}
	
	/// 回复web
	/// - Returns: 异步返回
	public func reply() -> Promise<Void> {
		let replyStr = getReplyString();
		self.associateWeb.controller?.webView.evaluateJavaScript(replyStr, completionHandler: nil);
		return Promise.value;
	}
}
