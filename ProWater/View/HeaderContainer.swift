//
//  HeaderContainer.swift
//  ProWater
//
//  Created by user188472 on 1/27/22.
//

import UIKit

class HeaderContainer: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    let userdefaults = UserDefaults()
    public var titleheader : String = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lblTitle.text = titleheader
        //changeTitle(title: titleheader)
        //changeTitle2()
        /*if let title = UserDefaults.standard.string(forKey: "title"){
            titleheader = title
            print(titleheader)
        }*/
        //changeTitle(title: titleheader)
        //print(titleheader)
        
    }
    
    public func changeTitle(title:String) {
        //lblTitle.text = title
        
    }
    
    func changeTitle2(){
        let story = value(forKey: "storyboardIdentifier") as? String ?? "none"
        
        print(story)
    }
    
    

}
