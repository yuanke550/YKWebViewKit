//
//  TestScript.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/3/29.
//

import Foundation
import PromiseKit

final public class TestScript: ScriptAble {
	
	public init(associate web: AssociateWeb) {
		self.receive = ReceiveScript(from: web)
		self.reply = ReplyScript(to: web)
	}
	
	public var receive: ReceiveScriptAble
	
	public var reply: ReplyScriptAble?
	
	public func action() -> Promise<Void> {
		
		return Promise.value
	}
	
	public class ReceiveScript: ReceiveScriptAble {
		
		public func decodeParm() -> Promise<Void> {
			guard let parmStr = self.receiveParmStr else {
				return Promise(error: PMKError.badInput)
			}
			self.receiveParm = Utils.Json.fromJson(parmStr, toClass: Parm.self);
			return Promise.value;
		}
		
		public var functionName: String {
			return "testScriptReceive"
		}
		
		public var associateWeb: AssociateWeb
		
		public var receiveParm: Parm?
		
		public var receiveParmStr: String?
		
		public class Parm: ScriptParm {
			
			public var uid: String?
			
			public var token: String?
			
		}
		
		public init(from web: AssociateWeb) {
			self.associateWeb = web
		}
	}
	
	public class ReplyScript: ReplyScriptAble {
		
		public func encodeParm() -> String {
			return Utils.Json.toJson(fromObject: self.replyParm)
		}
		
		public func getReplyString() -> String {
			return "\(functionName)('\(encodeParm())')";
		}
		
		public var functionName: String {
			return "testScriptReply"
		}
		
		public var associateWeb: AssociateWeb
		
		public var replyParm: Parm?
		
		public class Parm: ScriptParm {
			
			public var uid: String?
			
			public var token: String?
			
		}
		
		public init(to web: AssociateWeb) {
			self.associateWeb = web
		}
	}
	
}
