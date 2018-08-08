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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                print("😍 success")
                self.performSegue(withIdentifier: "gotoLoginView", sender: credential.oauthToken)
        },
            failure: { error in
                print("😂 \(error.description)")
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LoginViewController
        vc.token = sender as! String
    }
}

