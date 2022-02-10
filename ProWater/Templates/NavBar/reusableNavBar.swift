//
//  reusableNavBar.swift
//  ProWater
//
//  Created by user188472 on 1/28/22.
//

import UIKit

class reusableNavBar: UIView {

   
    @IBOutlet weak var btnHome: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        
        let xibView = Bundle.main.loadNibNamed("reusableNavBar", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    @IBAction func btnHomeAction(_ sender: Any) {
        print("Reviews")
    }
    @IBAction func btnHomeAction2(_ sender: Any) {
        print("ReviewsPhoto")
    }
}
