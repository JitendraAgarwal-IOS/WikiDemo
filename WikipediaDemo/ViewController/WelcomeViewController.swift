//
//  ViewController.swift
//  WikipediaDemo

//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var lblWelcomeNots: TypewriterLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        lblWelcomeNots.startTypewritingAnimation {
            UIView.animate(withDuration: 0.3, animations: {
                let wikiSearchVC = mainStoryboard.instantiateViewController(withIdentifier: String(describing: WikiSearchlistVC.self)) as! WikiSearchlistVC
               self.navigationController?.pushViewController(wikiSearchVC, animated: true)
                
                
            })
            
        }
    }
}

