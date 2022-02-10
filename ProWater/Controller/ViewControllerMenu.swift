//
//  ViewControllerMenu.swift
//  ProWater
//
//  Created by user188472 on 2/7/22.
//

import UIKit

class ViewControllerMenu: UIViewController {

    @IBOutlet weak var btnNewApp: UIButton!
    @IBOutlet weak var btnFollowUp: UIButton!
    @IBOutlet weak var btnReviews: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnReviewsOnClick(_ sender: Any) {
        performSegue(withIdentifier: "MenuToReviewsSegue", sender: self)
    }
    
}
