//
//  Script.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation
import WebKit

/// 关联web
public struct AssociateWeb {
	/// 控制器（弱引用）
	weak var controller: WebViewController?
}

/// 基础参数
public protocol ScriptParm: class, Codable {
	
	/// 用户ID
	var uid: String? { get set }
	
	/// Token
	var token: String? { get set }
	
}

public protocol Script {
	/// 方法名
	var functionName: String { get }
	/// 关联web
	var associateWeb: AssociateWeb { get }
	
}
