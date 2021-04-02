//
//  ScriptAble.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import PromiseKit

public protocol ScriptAble: class {
	/// 接受体
	var receive: ReceiveScriptAble { get set }
	/// 回复体
	var reply: ReplyScriptAble? { get }
	/// 业务
	func action() -> Promise<Void>
}

extension ScriptAble {
	
	public func receive(body: String) -> Promise<Void> {
		return self.receive.receive(parm: body).then { [weak self]() -> Promise<Void> in
			guard let `self` = self else {
				return Promise.value
			}
			return self.action()
		}.then { [weak self]() -> Promise<Void> in
			guard let reply = self?.reply else {
				return Promise.value
			}
			return reply.reply()
		}
	}

	public func reply() -> Promise<Void> {
		guard let reply = self.reply else {
			return Promise.value
		}
		return reply.reply()
	}
	
}
