//
//  WebViewController.swift
//  HXSDermatologyUserClient
//
//  Created by 袁科 on 2021/1/21.
//  Copyright © 2021 NGO. All rights reserved.
//

import Foundation
import WebKit
import SnapKit

public class WebViewController: UIViewController {
	
	required init(to url: String) {
		self.url = URL(string: url);
		self.request = URLRequest(url: self.url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60);
		super.init(nibName: nil, bundle: nil);
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default;
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad();
		self.setupUI();
		self.loadScript()
		self.requestWeb();
	}
	
	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated);
		self.navigationController?.setNavigationBarHidden(true, animated: false);
	}
	
	public override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated);
		self.navigationController?.setNavigationBarHidden(false, animated: false);
	}
	
	deinit {
		removeScript()
		debugPrint("WebViewController ------- deinit");
	}
	
	internal var scriptHandler: YKScriptHandler?;
	private var url: URL!;
	private var request: URLRequest!;
	
	lazy var webView: WKWebView = {
		let config = WKWebViewConfiguration()
		config.preferences.javaScriptEnabled = true
		config.preferences.javaScriptCanOpenWindowsAutomatically = false
		config.userContentController = WKUserContentController()
		let view = WKWebView(frame: CGRect.zero, configuration: config)
		view.navigationDelegate = self
		view.loadHTMLString("<input accept='image/*' type='file'>", baseURL: nil);
		view.scrollView.contentInsetAdjustmentBehavior = .never;
		return view;
	}();
}

extension WebViewController {
	fileprivate func setupUI() {
		view.addSubview(webView);
		webView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview();
		}
	}
	
	fileprivate func requestWeb() {
		webView.load(request);
	}
	
	fileprivate func loadScript() {
		for script in scriptHandler?.scripts ?? [] {
			webView.configuration.userContentController.add(WeakScriptMessageDelegate(with: self), name: script.receive.functionName)
		}
	}
	
	fileprivate func removeScript() {
		for script in scriptHandler?.scripts ?? [] {
			webView.configuration.userContentController.removeScriptMessageHandler(forName: script.receive.functionName);
		}
	}
}
