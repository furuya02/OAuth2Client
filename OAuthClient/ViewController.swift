//
//  ViewController.swift
//  OAuthClient
//
//  Created by SIN on 2018/08/08.
//  Copyright © 2018年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import OAuthSwift


class ViewController: UIViewController {
    
    var oauth2swift: OAuth2Swift?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapLoginButton(_ sender: Any) {
        self.oauth2swift = OAuth2Swift(
            consumerKey:    appId,
            consumerSecret: secretLKey,
            authorizeUrl:   "https://" + domain + ".auth." + region + ".amazoncognito.com/oauth2/authorize",
            accessTokenUrl: "https://" + domain + ".auth." + region + ".amazoncognito.com/oauth2/token",
            responseType:   "code"
        )
        self.oauth2swift?.authorizeURLHandler = OAuthSwiftOpenURLExternally.sharedInstance;
        let _ = self.oauth2swift?.authorize(
            withCallbackURL: URL(string: callbackUrl)!,
            scope: scope,
            state: "state",
            success: { credential, response, parameters in
                print("😍token=\(credential.oauthToken)")
                self.performSegue(withIdentifier: "gotoLoginView", sender: nil)
        },
            failure: { error in
                print("😂\(error.description)")
        })
    }
}

