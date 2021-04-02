//
//  Receive.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import PromiseKit

public protocol ReceiveScript: class, Script {
	/// 接受的原始参数
	var receiveParmStr: String? { get set }
	
}

public protocol ReceiveScriptAble: ReceiveScript {
	/// 解码原始参数
	func decodeParm() -> Promise<Void>
	
}

extension ReceiveScriptAble {
	
	/// 接收到请求
	/// - Parameter parm: 原始参数
	/// - Returns: 异步
	func receive(parm: String) -> Promise<Void> {
		self.receiveParmStr = parm
		return self.decodeParm()
	}
	
}
