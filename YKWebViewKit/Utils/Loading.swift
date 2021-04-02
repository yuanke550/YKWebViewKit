//
//  Loading.swift
//  NGOFund
//
//  Created by 李京珂 on 2020/3/23.
//  Copyright © 2020 NGO. All rights reserved.
//

import Foundation
import MBProgressHUD
public class Loading {
    
    static public func showLoading(msg:String, to view:UIView){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.bezelView.color = UIColor.init(white: 0, alpha: 0.7)
        hud.contentColor = UIColor.white
        hud.minSize = CGSize(width: 110, height: 110)
        hud.label.text = NSLocalizedString(msg, comment: "HUD loading title")
    }
    
    
    static public func hideLoading(from view:UIView){
        
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    static public func showToastOnSuccess(msg:String, to view:UIView){
        //需要自定义成功的view
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        let image = UIImage.init(named: "Success")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let imageView = UIImageView.init(image: image)
        hud.customView = imageView
        hud.mode = MBProgressHUDMode.customView
        hud.bezelView.color = UIColor.init(white: 0, alpha: 0.7)
        hud.contentColor = UIColor.white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.label.text = NSLocalizedString(msg, comment: "HUD completed title")
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: 2)
    }
    
    static public func showToastOnFail(msg:String, to view:UIView){
        //需要自定义失败的view
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        let image = UIImage.init(named: "Fail")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        let imageView = UIImageView.init(image: image)
        hud.customView = imageView
        hud.mode = MBProgressHUDMode.customView
        hud.bezelView.color = UIColor.init(white: 0, alpha: 0.7)
        hud.contentColor = UIColor.white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.label.text = NSLocalizedString(msg, comment: "HUD completed title")
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: 2)
    }
    
    static public func showToastWithMessage(msg:String, to view:UIView){
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.bezelView.color = UIColor.init(white: 0, alpha: 0.7)
        hud.contentColor = UIColor.white
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.label.text = NSLocalizedString(msg, comment: "HUD completed title")
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: 2)
    }
    
}
