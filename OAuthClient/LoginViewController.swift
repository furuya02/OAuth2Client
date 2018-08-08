//
//  LoginViewController.swift
//  OAuthClient
//
//  Created by SIN on 2018/08/08.
//  Copyright © 2018年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var token = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = token

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLogoutButton(_ sender: Any) {
        let url = URL(string: "https://" + domain + ".auth." + region + ".amazoncognito.com/logout?client_id=" + appId + "&response_type=code&scope=" + scope + "&redirect_uri=" + callbackUrl)
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
