//
//  HeaderReusableVC.swift
//  ProWater
//
//  Created by user188472 on 1/28/22.
//

import UIKit

class HeaderReusableVC: UIView {
    @IBOutlet weak var lbltitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit(){
        let xibView = Bundle.main.loadNibNamed("HeaderReusableVC", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
    
}
