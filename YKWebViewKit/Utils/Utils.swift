//
//  Utils.swift
//  YKWebViewKit
//
//  Created by 袁科 on 2021/2/4.
//

import Foundation

public struct Utils {}

extension Utils {
	public struct Json {
		public static func fromJson<T:Decodable>(_ json:String, toClass:T.Type)->T? {
			let jsonDecoder = JSONDecoder();
			return try? jsonDecoder.decode(toClass, from: json.data(using: .utf8)!);
		}
		
		public static func toJson<T:Encodable>(fromObject:T)->String {
			let encoder = JSONEncoder();
			return String(data: try! encoder.encode(fromObject), encoding: .utf8)!;
		}
	}
}
